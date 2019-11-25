#include "JFCRootListController.h"
#include<spawn.h>

@implementation JFCRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)openTwitter {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/adriandev_"] 
    options:@{}
    completionHandler:nil];
}

-(void)respring{
    pid_t pid;
    int status;
    const char* args[] = {"",NULL};
    posix_spawn(&pid, "/usr/bin/sbreload", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}

/*
pid_t pid;
    int status;
    const char* args[] = {"killall", "SpringBoard", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
*/

@end
