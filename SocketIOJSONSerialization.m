//
//  SocketIOJSONSerialization.m
//  v0.5.1
//
//  based on
//  socketio-cocoa https://github.com/fpotter/socketio-cocoa
//  by Fred Potter <fpotter@pieceable.com>
//
//  using
//  https://github.com/square/SocketRocket
//
//  reusing some parts of
//  /socket.io/socket.io.js
//
//  Created by Philipp Kyeck http://beta-interactive.de
//
//  With help from
//    https://github.com/pkyeck/socket.IO-objc/blob/master/CONTRIBUTORS.md
//

#import "SocketIOJSONSerialization.h"

@implementation SocketIOJSONSerialization

+ (id) objectFromJSONData:(NSData *)data error:(NSError **)error {
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:error];    
}

+ (NSString *) JSONStringFromObject:(id)object error:(NSError **)error {
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:0 error:error];
#if !__has_feature(objc_arc)
    return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
#else
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
#endif
}

@end
