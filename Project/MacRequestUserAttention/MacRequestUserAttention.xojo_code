#tag Module
Protected Module MacRequestUserAttention
	#tag Method, Flags = &h1
		Protected Sub RequestUserAttention(critical As Boolean = FALSE)
		  #if TargetCocoa
		    Declare Function NSClassFromString Lib "Cocoa" (aClassName As CFStringRef) As Ptr
		    Declare Function NSSelectorFromString Lib "Cocoa" (aSelectorName As CFStringRef) As Ptr
		    Declare Function RespondsToSelector Lib "Cocoa" Selector "respondsToSelector:" (NSApp As Ptr, aSelector As Ptr) As Boolean
		    Declare Function SharedApplication Lib "Cocoa" Selector "sharedApplication" (aClass As Ptr) As Ptr
		    Declare Function RequestUserAttention Lib "Cocoa" Selector "requestUserAttention:" (NSApp As Ptr, requestType As Integer) As Integer
		    
		    Const NSCriticalRequest = 0
		    Const NSInformationalRequest = 10
		    
		    DIM NSApp As Ptr = SharedApplication(NSClassFromString("NSApplication"))
		    DIM aSelector As Ptr = NSSelectorFromString("requestUserAttention:")
		    
		    if (RespondsToSelector(NSApp, aSelector)) then
		      if (critical) then
		        Call RequestUserAttention(NSApp, NSCriticalRequest)
		      else
		        Call RequestUserAttention(NSApp, NSInformationalRequest)
		      end if
		    end if
		  #endif
		End Sub
	#tag EndMethod


End Module
#tag EndModule
