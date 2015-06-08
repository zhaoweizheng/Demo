/* vim: set ft=objc fenc=utf-8 sw=2 ts=2 et: */
/*
 *  DOUAudioStreamer - A Core Audio based streaming audio player for iOS/Mac:
 *
 *      https://github.com/douban/DOUAudioStreamer
 *
 *  Copyright 2013-2014 Douban Inc.  All rights reserved.
 *
 *  Use and distribution licensed under the BSD license.  See
 *  the LICENSE file for full text.
 *
 *  Authors:
 *      Chongyu Zhu <i@lembacon.com>
 *
 */

#import <Foundation/Foundation.h>
#import "DOUAudioFile.h"


//创建的音乐类, 必须接受<DOUAudioFile>协议.

@interface Track : NSObject <DOUAudioFile>

@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) NSString *title;


//播放使用的URL, 这个属性必须为audioFileURL, 其他的都崩溃
@property (nonatomic, strong) NSURL *audioFileURL;

@end
