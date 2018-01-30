//
//  CreateAdUnitIdViewController.m
//  DemoApp
//
//  Created by Glispa GmbH on 16.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "CreateAdUnitIdViewController.h"
#import "Constants.h"

@interface CreateAdUnitIdViewController (DataSource) <UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>
- (void)saveAdUnitsToUserDefaults;
- (void)readAdUnitsFromUserDefaults;
@end


@interface CreateAdUnitIdViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *adUnitsTableView;
@property (weak, nonatomic) IBOutlet UIPickerView *adTypesPicker;
@property (weak, nonatomic) IBOutlet UITextField *adUnitIdTextField;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (strong, nonatomic) NSMutableArray <AdUnitId*> *adUnits;
@property (strong, nonatomic) NSArray <NSNumber*> *adTypes;

@end


@implementation CreateAdUnitIdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupData];
}

#pragma mark - Actions

- (IBAction)closeClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)createClicked:(UIButton *)sender {
    [self createNewAdUnitId];
}

#pragma mark - <UITextFieldDelegate>

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Private

- (void)setupUI {
    self.backgroundImageView.image = _backgroundImage;
}

- (void)setupData {
    self.adTypes = @[@(AdBanner), @(AdInterstitial), @(AdVideo), @(AdNative),  @(AdNativeAssets)];
    [self readAdUnitsFromUserDefaults];
}

- (BOOL)isValidAdUnitId:(NSString*)adUnitId {
    NSError *error = nil;
    NSString *allowedSymbols  = @"^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$";
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: allowedSymbols options:0 error:&error];
    return [regex firstMatchInString:adUnitId options:0 range: NSMakeRange(0, [adUnitId length])] != nil;
}

- (void)createNewAdUnitId {
    if ([self isValidAdUnitId:self.adUnitIdTextField.text]) {
        NSNumber *adType = self.adTypes[[self.adTypesPicker selectedRowInComponent:0]];
        AdUnitId *adUnit = [AdUnitId unitIdWith:self.adUnitIdTextField.text withAdType:(AdType)[adType integerValue]];
        
        NSUInteger index = [self.adUnits indexOfObjectPassingTest:^BOOL(AdUnitId * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj.adUnitId isEqualToString:adUnit.adUnitId];
        }];
        
        if (index == NSNotFound) {
            [self.adUnits addObject:adUnit];
            [self saveAdUnitsToUserDefaults];
        }
        
        if (self.backBlock) {
            self.backBlock(adUnit.adUnitId, adUnit.adType);
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Invalid format of adUnitId" message:@"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:okAction];
        [self presentViewController:alertVC animated:YES completion:nil];
    }
}

@end


@implementation CreateAdUnitIdViewController (DataSource)

- (void)saveAdUnitsToUserDefaults {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject: self.adUnits];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"savedAdUnitsArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)readAdUnitsFromUserDefaults {
    NSData *data = (NSData*)[[NSUserDefaults standardUserDefaults] objectForKey:@"savedAdUnitsArray"];
    NSArray *array = (NSArray*)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if (!array) {
        array = [self defaulAdUnitIds];
    }
    
    self.adUnits = [NSMutableArray arrayWithArray:array];
}


- (NSArray <AdUnitId*> *)defaulAdUnitIds {
    return @[[AdUnitId unitIdWith:DefaultAdUnitId.bannerAdUnitID withAdType:AdBanner],
             [AdUnitId unitIdWith:DefaultAdUnitId.interstitialAdUnitID withAdType:AdInterstitial],
             [AdUnitId unitIdWith:DefaultAdUnitId.videoAdUnitID withAdType:AdVideo],
             [AdUnitId unitIdWith:DefaultAdUnitId.nativeAdUnitID withAdType:AdNative],
             [AdUnitId unitIdWith:DefaultAdUnitId.nativeAssetsAdUnitID withAdType:AdNativeAssets]
            ];
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.adUnits.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    AdUnitId *item = self.adUnits[indexPath.row];
    cell.textLabel.text = item.adUnitId;
    cell.detailTextLabel.text = [self adTypeStringValue:item.adType];
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AdUnitId *item = self.adUnits[indexPath.row];
    
    if (self.backBlock) {
        self.backBlock(item.adUnitId, item.adType);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - PickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.adTypes.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self adTypeStringValue:(AdType)[self.adTypes[row] integerValue]];
}

- (NSString*)adTypeStringValue:(AdType)adType {
    switch (adType) {
        case AdBanner:
            return @"banner";
            
        case AdInterstitial:
            return @"interstitial";
            
        case AdVideo:
            return @"video";
            
        case AdNative:
            return @"native ad";
            
        case AdNativeAssets:
            return @"native assets ad";
            
        default:
            return @"unknown";
    }
}
@end


@implementation AdUnitId

+ (instancetype)unitIdWith:(NSString*)adUnitId withAdType:(AdType)adType {
    AdUnitId *instance = [self new];
    instance.adUnitId = adUnitId;
    instance.adType = adType;
    return instance;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.adUnitId forKey:@"adUnitId"];
    [aCoder encodeObject:@(self.adType) forKey:@"adUnitType"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.adUnitId = [aDecoder decodeObjectForKey:@"adUnitId"];
        self.adType = (AdType)[[aDecoder decodeObjectForKey:@"adUnitType"] integerValue];
    }
    return self;
}
@end
