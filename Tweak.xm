@interface SBUILegibilityLabel : UIView
@property (nonatomic, strong, readwrite) UIFont *font;
@property (nonatomic, assign, readwrite) CGFloat strength;
@property (nonatomic, assign, readwrite) CGRect frame;
@property (nonatomic, copy, readwrite) NSString *string;
//baselineOffset is needed to fix a bug with the stock "% charged" label when phone is plugged in. Without it the label is moved offscreen.
@property (nonatomic, assign, readwrite) CGFloat baselineOffset;
@end

@interface SBFLockScreenDateView : UIView
@property (nonatomic, assign, readwrite, getter=isSubtitleHidden) BOOL subtitleHidden;
@end

@interface SBFLockScreenDateSubtitleDateView : UIView
@end

@interface SBFLockScreenAlternateDateLabel : UIView
@end

@interface SBLockScreenTimerView : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.adriandev.jellyfishcustom"];

	id size = [bundleDefaults valueForKey:@"size"];

%hook SBUILegibilityLabel
-(void)setFont:(UIFont *)arg1 {
	  if ([self.superview class] == objc_getClass("SBLockScreenTimerView")) {
		  if ([size isEqual:@3]) {
			  arg1 = [arg1 fontWithSize:65.0f];
		  }
		  if ([size isEqual:@4]) {
			  arg1 = [arg1 fontWithSize:58.0f];
		  }
		  if ([size isEqual:@5]) {
			  arg1 = [arg1 fontWithSize:50.0f];
		  }
		  if ([size isEqual:@6]) {
			  arg1 = [arg1 fontWithSize:43.0f];
		  }
		  %orig;
	  }
	  if (self.baselineOffset == 5.5) { //stops stock % charged label from changing
		  %orig;
	  } else if ([self.superview class] == objc_getClass("SBFLockScreenDateView") || [self.superview class] == objc_getClass("SBFLockScreenDateSubtitleDateView") || [self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel") || self.strength == 1.5 || [self.string containsString:@"%"]) {
		if ([size isEqual:@0]) {
			if ([self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel")) { //alt calendar
				arg1 = [arg1 fontWithSize:15.0f];
			} else if (self.strength == 0.25) { //time
				arg1 = [arg1 fontWithSize:86.4f];
			} else if (self.strength == 1.5) { //weather
				arg1 = [arg1 fontWithSize:24.0f];
			} else if (self.strength == 0.35) { //date
				arg1 = [arg1 fontWithSize:86.4f];
			}
	} else if ([size isEqual:@1]) {
			if ([self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel")) { //alt calendar
				arg1 = [arg1 fontWithSize:15.0f];
			} else if (self.strength == 0.25) { //time
				arg1 = [arg1 fontWithSize:79.2f];
			} else if (self.strength == 1.5) { //weather
				arg1 = [arg1 fontWithSize:22.0f];
			} else if (self.strength == 0.35) { //date
				arg1 = [arg1 fontWithSize:79.2f];
			}
	} else if ([size isEqual:@3]) {
			if ([self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel")) { //alt calendar
				arg1 = [arg1 fontWithSize:15.0f];
			} else if (self.strength == 0.25) { //time
				arg1 = [arg1 fontWithSize:65.0f];
			} else if (self.strength == 1.5) { //weather
				arg1 = [arg1 fontWithSize:18.0f];
			} else if (self.strength == 0.35) { //date
				arg1 = [arg1 fontWithSize:65.0f];
			}
	} else if ([size isEqual:@4]) {
			if ([self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel")) {
				arg1 = [arg1 fontWithSize:15.0f];
			} else if (self.strength == 0.25) {
				arg1 = [arg1 fontWithSize:58.0f];
			} else if (self.strength == 1.5) {
				arg1 = [arg1 fontWithSize:16.0f];
			} else if (self.strength == 0.35) {
				arg1 = [arg1 fontWithSize:58.0f];
			}
	} else if ([size isEqual:@5]) {
			if ([self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel")) {
				arg1 = [arg1 fontWithSize:15.0f];
			} else if (self.strength == 0.25) {
				arg1 = [arg1 fontWithSize:50.0f];
			} else if (self.strength == 1.5) {
				arg1 = [arg1 fontWithSize:14.0f];
			} else if (self.strength == 0.35) {
				arg1 = [arg1 fontWithSize:50.0f];
			}
	} else if ([size isEqual:@6]) {
			if ([self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel")) {
				arg1 = [arg1 fontWithSize:15.0f];
			} else if (self.strength == 0.25) {
				arg1 = [arg1 fontWithSize:43.0f];
			} else if (self.strength == 1.5) {
				arg1 = [arg1 fontWithSize:12.0f];
			} else if (self.strength == 0.35) {
				arg1 = [arg1 fontWithSize:43.0f];
			}
	}
	}
	%orig;
}


//Repositions labels after font change
- (void)setFrame:(CGRect)frame {
	if (self.baselineOffset == 5.5) {
		%orig;
	} else if ([self.superview class] == objc_getClass("SBFLockScreenDateView") || [self.superview class] == objc_getClass("SBFLockScreenDateSubtitleDateView") || [self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel") || self.strength == 1.5 || [self.string containsString:@"%"]) {
		if ([size isEqual:@0]) {
			if ([self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel")) { //alt calendar
				frame.origin.y = 8;
				return %orig(frame);
			} else if (self.strength == 0.35) { //date
				frame.origin.y = 13;
				return %orig(frame);
			}
	} else if ([size isEqual:@1]) {
			if ([self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel")) { //alt calendar
				frame.origin.y = -5;
				return %orig(frame);
			} else if (self.strength == 0.35) { //date
				frame.origin.y = 5;
				return %orig(frame);
			}
	} else if ([size isEqual:@3]) {
			if ([self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel")) { //alt calendar
				frame.origin.y = -21;
				return %orig(frame);
			} else if (self.strength == 0.35) { //date
				frame.origin.x = -130;
				frame.origin.y = -11;
				return %orig(frame);
			}
	}	else if ([size isEqual:@4]) {
			if ([self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel")) {
				frame.origin.y = -24;
				return %orig(frame);
			} else if (self.strength == 0.35) {
				frame.origin.y = -17;
				return %orig(frame);
			}
	} else if ([size isEqual:@5]) {
			if ([self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel")) {
				frame.origin.y = -32;
				return %orig(frame);
			} else if (self.strength == 0.35) {
				frame.origin.y = -25;
				return %orig(frame);
			}
	} else if ([size isEqual:@6]) {
			if ([self.superview class] == objc_getClass("SBFLockScreenAlternateDateLabel")) {
				frame.origin.y = -39;
				return %orig(frame);
			} else if (self.strength == 0.35) {
				frame.origin.y = -31;
				return %orig(frame);
			}
	}
	}
	return %orig;
}
%end

%hook SBLockScreenTimerView
- (void)setFrame:(CGRect)frame {
	if ([size isEqual:@0]) {
		if (frame.origin.y != 76.5) {
			frame.origin.y = 76.5;
			return %orig(frame);
	}
	} else if ([size isEqual:@1]) {
		if (frame.origin.y != 68.5) {
			frame.origin.y = 68.5;
			return %orig(frame);
		}
	} else if ([size isEqual:@2]) {
		%orig;
	} else if ([size isEqual:@3]) {
		if (frame.origin.y != 52.5) {
			frame.origin.y = 52.5;
			return %orig(frame);
		}
	} else if ([size isEqual:@4]) {
		if (frame.origin.y != 46.5) {
			frame.origin.y = 46.5;
			return %orig(frame);
	}
	} else if ([size isEqual:@5]) {
		if (frame.origin.y != 38.5) {
			frame.origin.y = 38.5;
			return %orig(frame);
		}
	} else if ([size isEqual:@6]) {
		if (frame.origin.y != 32.5) {
			frame.origin.y = 32.5;
			return %orig(frame);
		}
	}
	return %orig;
}
%end