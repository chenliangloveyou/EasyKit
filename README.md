# EasyBluetooth

一款iOS BLE蓝牙调试工具，非常简单容易，也可以作为一个蓝牙库，快速集成和开发。
可以两步搞定蓝牙开发操作。
第一步连接设别，第二部特征读写数据。

# Preview


# 使用方法

### 配置参数讲解

#### 如下的参数都可以不传
  
    蓝牙所有操作所在的线程。如果不传，将会在主线程上操作。
    蓝牙所有操作所在的线程。如果不传，将会在主线程上操作。
    note：如果传入线程，那么返回数据的UI操作需要放到主线程上
    @property (nonatomic,strong)dispatch_queue_t managerQueue ;
    
    CBCentralManagerOptionShowPowerAlertKey  默认为NO，系统当蓝牙关闭时是否弹出一个警告框
    CBCentralManagerOptionRestoreIdentifierKey 系统被杀死，重新恢复centermanager的ID
    @property (nonatomic,strong)NSDictionary *managerDictionary ;
  
    CBCentralManagerScanOptionAllowDuplicatesKey  默认为NO，过滤功能是否启用，每次寻找都会合并相同的peripheral。如果设备YES的话每次都能接受到来自peripherals的广播包数据。
     CBCentralManagerScanOptionSolicitedServiceUUIDsKey  想要扫描的服务的UUID，以一个数组的形式存在。扫描的时候只会扫描到包含这些UUID的设备。
    @property (nonatomic,strong)NSDictionary *scanOptions ;
  
    连接设备所需的服务.
    @property (nonatomic,strong)NSArray *scanServiceArray ;
  
    CBConnectPeripheralOptionNotifyOnConnectionKey    默认为NO，APP被挂起时，这时如果连接到peripheral时，是否要给APP一个提示框。
    CBConnectPeripheralOptionNotifyOnDisconnectionKey 默认为NO，APP被挂起时，恰好在这个时候断开连接，要不要给APP一个断开提示。 
    CBConnectPeripheralOptionNotifyOnNotificationKey  默认为NO，APP被挂起时，是否接受到所有的来自peripheral的包都要弹出提示框。
    @property (nonatomic,strong)NSDictionary *connectOptions ;//连接设备时所带的条件`

    扫描所需时间。默认为永久
    @property (nonatomic,assign)NSUInteger scanTimeOut ;

    连接设备最大时长 默认为5秒
    @property (nonatomic,assign)NSUInteger connectTimeOut ;

    断开连接后重新连接
    @property (nonatomic,assign)BOOL autoConnectAfterDisconnect ;


#### 获取单例，并赋值配置信息
   
    获取单例
    + (instancetype)shareInstance ;
    创建配置信息
    EasyManagerOptions *options = [EasyManagerOptions alloc]init];
    options.autoConnectAfterDisconnect - YES ;
    options.connectTimeOut = 6 ;
    设置配置信息
    [EasyBlueToothManager shareInstance].managerOptions = options ;
     
### 使用场景

#### 扫描设备名称后直接连接设备

```
/**
 * 连接一个已知名字的设备
 * name 设备名称
 * callback 连接设备的回调信息
 */
- (void)scanAndConnectDeviceWithName:(NSString *)name
                            callback:(blueToothScanCallback)callback ;
                            ```
#### 扫描设备后选择一些符合规则的设备后连接
```
/**
 * 连接一个一定规则的设备，依据peripheral里面的名称，广播数据，RSSI来赛选需要的连接的设备
 * name 设备名称
 * callback 连接设备的回调信息
 */
- (void)scanAndConnectDeviceWithRule:(blueToothScanRule)rule
                            callback:(blueToothScanCallback)callback ;```

#### 需要保存设备，然后直接连接单个设备


1，先扫描符合规则的设备 选择一个保存设备的uuid到本地
```
/**
 * 根据规则扫描符合名称的所有设备
 */
- (void)scanAllDeviceWithRule:(blueToothScanRule)rule
                     callback:(blueToothScanAllCallback)callback ;
 ```
2，取出上一步中保存的uuid直接连接
```
/**
 * 连接一个确定ID的设备，一般此ID可以保存在本地。然后直接连接
 * name 设备名称
 * callback 连接设备的回调信息
 */
- (void)scanAndConnectDeviceWithIdentifier:(NSString *)identifier
                                  callback:(blueToothScanCallback)callback ;
  ```

#### 单纯的操作一些设备信息，可以采用一行代码
```
/**
 * 一行代码连接所有的设备
 * name         一直设别的名称
 * serviceuuid  服务id
 * notifyuuid   监听端口的id
 * writeuuid    写数据的id
 * data         需要发送给设备的数据
 * callback     回调信息
 */
- (void)connectDeviceWithName:(NSString *)name
                  serviceUUID:(NSString *)serviceUUID
                   notifyUUID:(NSString *)notifyUUID
                    wirteUUID:(NSString *)writeUUID
                    writeData:(NSData *)data
                     callback:(blueToothOperationCallback)callback;

```

#### 需要连接多个设备

```
/**
 * 连接已知名称的所有设备（返回的是一组此名称的设备全部连接成功）
 * name 设备名称
 * callback 连接设备的回调信息
 */
- (void)scanAndConnectAllDeviceWithName:(NSString *)name
                               callback:(blueToothScanAllCallback)callback ;

/**
 * 连接已知规则的全部设备（返回的是一组此名称的设备全部连接成功）
 * name 设备名称
 * callback 连接设备的回调信息
 */
- (void)scanAndConnectAllDeviceWithRule:(blueToothScanRule)rule
                               callback:(blueToothScanAllCallback)callback ;
  ```

# 联系作者
如果在使用过程中遇到任务问题，或者发现使用不够恰当。希望能Issues我。

email: chenliangloveyou@163.com
