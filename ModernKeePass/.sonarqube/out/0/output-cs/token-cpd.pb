�
GC:\Sources\Other\ModernKeePass\ModernKeePass\Actions\ClipboardAction.cs
	namespace 	
ModernKeePass
 
. 
Actions 
{ 
public 

class 
ClipboardAction  
:! "
DependencyObject# 3
,3 4
IAction5 <
{ 
public		 
string		 
Text		 
{

 	
get 
{ 
return 
( 
string  
)  !
GetValue! )
() *
TextProperty* 6
)6 7
;7 8
}9 :
set 
{ 
SetValue 
( 
TextProperty '
,' (
value) .
). /
;/ 0
}1 2
} 	
public 
static 
readonly 
DependencyProperty 1
TextProperty2 >
=? @
DependencyProperty 
. 
Register '
(' (
$str( .
,. /
typeof0 6
(6 7
string7 =
)= >
,> ?
typeof@ F
(F G
ClipboardActionG V
)V W
,W X
newY \
PropertyMetadata] m
(m n
stringn t
.t u
Emptyu z
)z {
){ |
;| }
public 
object 
Execute 
( 
object $
sender% +
,+ ,
object- 3
	parameter4 =
)= >
{ 	
var 
dataPackage 
= 
new !
DataPackage" -
{. /
RequestedOperation0 B
=C D 
DataPackageOperationE Y
.Y Z
CopyZ ^
}_ `
;` a
dataPackage 
. 
SetText 
(  
Text  $
)$ %
;% &
	Clipboard 
. 

SetContent  
(  !
dataPackage! ,
), -
;- .
return 
null 
; 
} 	
} 
} �
KC:\Sources\Other\ModernKeePass\ModernKeePass\Actions\NavigateToUrlAction.cs
	namespace 	
ModernKeePass
 
. 
Actions 
{ 
public 

class 
NavigateToUrlAction $
:% &
DependencyObject' 7
,7 8
IAction9 @
{		 
public

 
string

 
Url

 
{ 	
get 
{ 
return 
( 
string  
)  !
GetValue! )
() *
UrlProperty* 5
)5 6
;6 7
}8 9
set 
{ 
SetValue 
( 
UrlProperty &
,& '
value( -
)- .
;. /
}0 1
} 	
public 
static 
readonly 
DependencyProperty 1
UrlProperty2 =
=> ?
DependencyProperty 
. 
Register '
(' (
$str( -
,- .
typeof/ 5
(5 6
string6 <
)< =
,= >
typeof? E
(E F
NavigateToUrlActionF Y
)Y Z
,Z [
new\ _
PropertyMetadata` p
(p q
stringq w
.w x
Emptyx }
)} ~
)~ 
;	 �
public 
object 
Execute 
( 
object $
sender% +
,+ ,
object- 3
	parameter4 =
)= >
{ 	
try 
{ 
var 
uri 
= 
new 
Uri !
(! "
Url" %
)% &
;& '
return 
Windows 
. 
System %
.% &
Launcher& .
.. /
LaunchUriAsync/ =
(= >
uri> A
)A B
.B C

GetAwaiterC M
(M N
)N O
.O P
	GetResultP Y
(Y Z
)Z [
;[ \
} 
catch 
( 
	Exception 
ex 
)  
{ 
MessageDialogHelper #
.# $
ShowErrorDialog$ 3
(3 4
ex4 6
)6 7
;7 8
return 
false 
; 
} 
} 	
}   
}!! �
HC:\Sources\Other\ModernKeePass\ModernKeePass\Actions\SetupFocusAction.cs
	namespace 	
ModernKeePass
 
. 
Actions 
{ 
public		 

class		 
SetupFocusAction		 !
:		" #
DependencyObject		$ 4
,		4 5
IAction		6 =
{

 
public 
Control 
TargetObject #
{ 	
get 
{ 
return 
( 
Control !
)! "
GetValue" *
(* + 
TargetObjectProperty+ ?
)? @
;@ A
}B C
set 
{ 
SetValue 
(  
TargetObjectProperty /
,/ 0
value1 6
)6 7
;7 8
}9 :
} 	
public 
static 
readonly 
DependencyProperty 1 
TargetObjectProperty2 F
=G H
DependencyProperty 
. 
Register '
(' (
$str( 6
,6 7
typeof8 >
(> ?
Control? F
)F G
,G H
typeofI O
(O P
SetupFocusActionP `
)` a
,a b
newc f
PropertyMetadatag w
(w x
nullx |
)| }
)} ~
;~ 
public 
object 
Execute 
( 
object $
sender% +
,+ ,
object- 3
	parameter4 =
)= >
{ 	
return 
Task 
. 
Factory 
.  
StartNew  (
(( )
( 
) 
=> 

Dispatcher  
.  !
RunAsync! )
() *"
CoreDispatcherPriority* @
.@ A
LowA D
,D E
( 
) 
=> 
TargetObject &
?& '
.' (
Focus( -
(- .

FocusState. 8
.8 9
Programmatic9 E
)E F
)F G
)G H
;H I
} 	
} 
} �\
8C:\Sources\Other\ModernKeePass\ModernKeePass\App.xaml.cs
	namespace 	
ModernKeePass
 
{ 
sealed 

partial 
class 
App 
{ 
public 
App 
( 
) 
{ 	
HockeyClient 
. 
Current  
.  !
	Configure! *
(* +
$str+ M
)M N
;N O
InitializeComponent 
(  
)  !
;! "

Suspending   
+=   
OnSuspending   &
;  & '
Resuming!! 
+=!! 

OnResuming!! "
;!!" #
UnhandledException"" 
+="" ! 
OnUnhandledException""" 6
;""6 7
}## 	
private(( 
void((  
OnUnhandledException(( )
((() *
object((* 0
sender((1 7
,((7 8'
UnhandledExceptionEventArgs((9 T'
unhandledExceptionEventArgs((U p
)((p q
{)) 	
var++ 
	exception++ 
=++ '
unhandledExceptionEventArgs++ 7
.++7 8
	Exception++8 A
;++A B
var,, 
realException,, 
=,, 
	exception-- 
is-- %
TargetInvocationException-- 6
&&--7 9
	exception.. 
... 
InnerException.. (
!=..) +
null.., 0
?// 
	exception// 
.//  
InnerException//  .
:00 
	exception00 
;00  
if22 
(22 
realException22 
is22  
SaveException22! .
)22. /
{33 '
unhandledExceptionEventArgs44 +
.44+ ,
Handled44, 3
=444 5
true446 :
;44: ;
MessageDialogHelper55 #
.55# $
SaveErrorDialog55$ 3
(553 4
realException554 A
as55B D
SaveException55E R
,55R S
DatabaseService55T c
.55c d
Instance55d l
)55l m
;55m n
}66 
else77 
if77 
(77 
realException77 "
is77# %#
DatabaseOpenedException77& =
)77= >
{88 '
unhandledExceptionEventArgs99 +
.99+ ,
Handled99, 3
=994 5
true996 :
;99: ;
MessageDialogHelper:: #
.::# $
SaveUnchangedDialog::$ 7
(::7 8
realException::8 E
as::F H#
DatabaseOpenedException::I `
,::` a
DatabaseService::b q
.::q r
Instance::r z
)::z {
;::{ |
};; 
}<< 	
	protectedCC 
overrideCC 
asyncCC  
voidCC! %

OnLaunchedCC& 0
(CC0 1$
LaunchActivatedEventArgsCC1 I
eCCJ K
)CCK L
{DD 	
OnLaunchOrActivatedEE 
(EE  
eEE  !
)EE! "
;EE" #
awaitFF 
HockeyClientFF 
.FF 
CurrentFF &
.FF& '
SendCrashesAsyncFF' 7
(FF7 8
)FFU V
;FFV W
}GG 	
	protectedII 
overrideII 
voidII 
OnActivatedII  +
(II+ ,
IActivatedEventArgsII, ?
argsII@ D
)IID E
{JJ 	
OnLaunchOrActivatedKK 
(KK  
argsKK  $
)KK$ %
;KK% &
}LL 	
privateNN 
voidNN 
OnLaunchOrActivatedNN (
(NN( )
IActivatedEventArgsNN) <
eNN= >
)NN> ?
{OO 	
ifRR 
(RR 
SystemRR 
.RR 
DiagnosticsRR "
.RR" #
DebuggerRR# +
.RR+ ,

IsAttachedRR, 6
)RR6 7
{SS 
}UU 
varXX 
	rootFrameXX 
=XX 
WindowXX "
.XX" #
CurrentXX# *
.XX* +
ContentXX+ 2
asXX3 5
FrameXX6 ;
;XX; <
if\\ 
(\\ 
	rootFrame\\ 
==\\ 
null\\ !
)\\! "
{]] 
	rootFrame__ 
=__ 
new__ 
Frame__  %
{__& '
Language__' /
=__0 1
Windows__2 9
.__9 :
Globalization__: G
.__G H 
ApplicationLanguages__H \
.__\ ]
	Languages__] f
[__f g
$num__g h
]__h i
}__i j
;__j k
	rootFramebb 
.bb 
NavigationFailedbb *
+=bb+ -
OnNavigationFailedbb. @
;bb@ A
ifdd 
(dd 
edd 
.dd "
PreviousExecutionStatedd ,
==dd- /%
ApplicationExecutionStatedd0 I
.ddI J

TerminatedddJ T
)ddT U
{ee 
MessageDialogHelperhh '
.hh' ("
ShowNotificationDialoghh( >
(hh> ?
$strhh? O
,hhO P
$strhhQ }
)hh} ~
;hh~ 
}jj 
Windowmm 
.mm 
Currentmm 
.mm 
Contentmm &
=mm' (
	rootFramemm) 2
;mm2 3
}nn 
ifpp 
(pp 
epp 
ispp $
LaunchActivatedEventArgspp -
)pp- .
{qq 
varrr #
lauchActivatedEventArgsrr +
=rr, -
(rr. /$
LaunchActivatedEventArgsrr/ G
)rrG H
errI J
;rrJ K
ifss 
(ss 
	rootFramess 
.ss 
Contentss %
==ss& (
nullss) -
)ss- .
{tt 
	rootFramexx 
.xx 
Navigatexx &
(xx& '
typeofxx' -
(xx- .
MainPagexx. 6
)xx6 7
,xx7 8#
lauchActivatedEventArgsxx9 P
.xxP Q
	ArgumentsxxQ Z
)xxZ [
;xx[ \
}yy 
} 
Window
�� 
.
�� 
Current
�� 
.
�� 
Activate
�� #
(
��# $
)
��$ %
;
��% &
}
�� 	
private
�� 
async
�� 
void
�� 

OnResuming
�� %
(
��% &
object
��& ,
sender
��- 3
,
��3 4
object
��5 ;
e
��< =
)
��= >
{
�� 	
var
�� 
currentFrame
�� 
=
�� 
Window
�� %
.
��% &
Current
��& -
.
��- .
Content
��. 5
as
��6 8
Frame
��9 >
;
��> ?
var
�� 
database
�� 
=
�� 
DatabaseService
�� *
.
��* +
Instance
��+ 3
;
��3 4
if
�� 
(
�� 
database
�� 
.
�� 
DatabaseFile
�� %
==
��& (
null
��) -
)
��- .
{
�� %
ToastNotificationHelper
�� '
.
��' (
ShowGenericToast
��( 8
(
��8 9
$str
��9 H
,
��H I
$str
��J v
)
��v w
;
��w x
return
�� 
;
�� 
}
�� 
try
�� 
{
�� 
if
�� 
(
�� 
database
�� 
.
�� 
CompositeKey
�� )
!=
��* ,
null
��- 1
)
��1 2
await
��3 8
database
��9 A
.
��A B
ReOpen
��B H
(
��H I
)
��I J
;
��J K
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
currentFrame
�� 
?
�� 
.
�� 
Navigate
�� &
(
��& '
typeof
��' -
(
��- .
MainPage
��. 6
)
��6 7
)
��7 8
;
��8 9!
MessageDialogHelper
�� #
.
��# $
ShowErrorDialog
��$ 3
(
��3 4
ex
��4 6
)
��6 7
;
��7 8%
ToastNotificationHelper
�� '
.
��' (
ShowGenericToast
��( 8
(
��8 9
$str
��9 H
,
��H I
$str
��J t
)
��t u
;
��u v
}
�� 
}
�� 	
void
��  
OnNavigationFailed
�� 
(
��  
object
��  &
sender
��' -
,
��- .'
NavigationFailedEventArgs
��/ H
e
��I J
)
��J K
{
�� 	
throw
�� 
new
�� 
	Exception
�� 
(
��  
$str
��  6
+
��7 8
e
��9 :
.
��: ;
SourcePageType
��; I
.
��I J
FullName
��J R
)
��R S
;
��S T
}
�� 	
private
�� 
async
�� 
void
�� 
OnSuspending
�� '
(
��' (
object
��( .
sender
��/ 5
,
��5 6!
SuspendingEventArgs
��7 J
e
��K L
)
��L M
{
�� 	
var
�� 
deferral
�� 
=
�� 
e
�� 
.
�� !
SuspendingOperation
�� 0
.
��0 1
GetDeferral
��1 <
(
��< =
)
��= >
;
��> ?
var
�� 
database
�� 
=
�� 
DatabaseService
�� *
.
��* +
Instance
��+ 3
;
��3 4
try
�� 
{
�� 
if
�� 
(
�� 
SettingsService
�� #
.
��# $
Instance
��$ ,
.
��, -

GetSetting
��- 7
(
��7 8
$str
��8 E
,
��E F
true
��G K
)
��K L
)
��L M
database
��N V
.
��V W
Save
��W [
(
��[ \
)
��\ ]
;
��] ^
await
�� 
database
�� 
.
�� 
Close
�� $
(
��$ %
false
��% *
)
��* +
;
��+ ,
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� &
)
��& '
{
�� %
ToastNotificationHelper
�� '
.
��' (
ShowErrorToast
��( 6
(
��6 7
	exception
��7 @
)
��@ A
;
��A B
}
�� 
deferral
�� 
.
�� 
Complete
�� 
(
�� 
)
�� 
;
��  
}
�� 	
	protected
�� 
override
�� 
void
�� 
OnFileActivated
��  /
(
��/ 0$
FileActivatedEventArgs
��0 F
args
��G K
)
��K L
{
�� 	
base
�� 
.
�� 
OnFileActivated
��  
(
��  !
args
��! %
)
��% &
;
��& '
var
�� 
	rootFrame
�� 
=
�� 
new
�� 
Frame
��  %
(
��% &
)
��& '
;
��' (
DatabaseService
�� 
.
�� 
Instance
�� $
.
��$ %
DatabaseFile
��% 1
=
��2 3
args
��4 8
.
��8 9
Files
��9 >
[
��> ?
$num
��? @
]
��@ A
as
��B D
StorageFile
��E P
;
��P Q
	rootFrame
�� 
.
�� 
Navigate
�� 
(
�� 
typeof
�� %
(
��% &
MainPage
��& .
)
��. /
,
��/ 0
args
��1 5
)
��5 6
;
��6 7
Window
�� 
.
�� 
Current
�� 
.
�� 
Content
�� "
=
��# $
	rootFrame
��% .
;
��. /
Window
�� 
.
�� 
Current
�� 
.
�� 
Activate
�� #
(
��# $
)
��$ %
;
��% &
}
�� 	
}
�� 
}�� �X
OC:\Sources\Other\ModernKeePass\ModernKeePass\Converters\IntToSymbolConverter.cs
	namespace 	
ModernKeePass
 
. 

Converters "
{ 
public 

class  
IntToSymbolConverter %
:& '
IValueConverter( 7
{		 
public

 
object

 
Convert

 
(

 
object

 $
value

% *
,

* +
Type

, 0

targetType

1 ;
,

; <
object

= C
	parameter

D M
,

M N
string

O U
language

V ^
)

^ _
{ 	
var 
icon 
= 
( 
PwIcon 
) 
value  %
;% &
switch 
( 
icon 
) 
{ 
case 
PwIcon 
. 
Key 
:  
return! '
Symbol( .
.. /
Permissions/ :
;: ;
case 
PwIcon 
. 
WorldSocket '
:' (
case 
PwIcon 
. 
World !
:! "
return# )
Symbol* 0
.0 1
World1 6
;6 7
case 
PwIcon 
. 
Warning #
:# $
return% +
Symbol, 2
.2 3
	Important3 <
;< =
case 
PwIcon 
. 
WorldComputer )
:) *
case 
PwIcon 
. 
Drive !
:! "
case 
PwIcon 
. 
DriveWindows (
:( )
case 
PwIcon 
. 
NetworkServer )
:) *
return+ 1
Symbol2 8
.8 9
MapDrive9 A
;A B
case 
PwIcon 
. 
MarkedDirectory +
:+ ,
return- 3
Symbol4 :
.: ;
Map; >
;> ?
case 
PwIcon 
. 
UserCommunication -
:- .
return/ 5
Symbol6 <
.< =
ContactInfo= H
;H I
case 
PwIcon 
. 
Parts !
:! "
return# )
Symbol* 0
.0 1
ViewAll1 8
;8 9
case 
PwIcon 
. 
Notepad #
:# $
return% +
Symbol, 2
.2 3
Document3 ;
;; <
case 
PwIcon 
. 
Identity $
:$ %
return& ,
Symbol- 3
.3 4
Contact24 <
;< =
case 
PwIcon 
. 

PaperReady &
:& '
return( .
Symbol/ 5
.5 6

SyncFolder6 @
;@ A
case 
PwIcon 
. 
Digicam #
:# $
return% +
Symbol, 2
.2 3
Camera3 9
;9 :
case 
PwIcon 
. 
IRCommunication +
:+ ,
return- 3
Symbol4 :
.: ;
View; ?
;? @
case 
PwIcon 
. 
Energy "
:" #
return$ *
Symbol+ 1
.1 2
ZeroBars2 :
;: ;
case   
PwIcon   
.   
Scanner   #
:  # $
return  % +
Symbol  , 2
.  2 3
Scan  3 7
;  7 8
case!! 
PwIcon!! 
.!! 
CDRom!! !
:!!! "
return!!# )
Symbol!!* 0
.!!0 1
Rotate!!1 7
;!!7 8
case"" 
PwIcon"" 
."" 
Monitor"" #
:""# $
return""% +
Symbol"", 2
.""2 3
Caption""3 :
;"": ;
case## 
PwIcon## 
.## 
EMailBox## $
:##$ %
case$$ 
PwIcon$$ 
.$$ 
EMail$$ !
:$$! "
return$$# )
Symbol$$* 0
.$$0 1
Mail$$1 5
;$$5 6
case%% 
PwIcon%% 
.%% 
Configuration%% )
:%%) *
return%%+ 1
Symbol%%2 8
.%%8 9
Setting%%9 @
;%%@ A
case&& 
PwIcon&& 
.&& 
ClipboardReady&& *
:&&* +
return&&, 2
Symbol&&3 9
.&&9 :
Paste&&: ?
;&&? @
case'' 
PwIcon'' 
.'' 
PaperNew'' $
:''$ %
return''& ,
Symbol''- 3
.''3 4
Page2''4 9
;''9 :
case(( 
PwIcon(( 
.(( 
Screen(( "
:((" #
return(($ *
Symbol((+ 1
.((1 2
	GoToStart((2 ;
;((; <
case)) 
PwIcon)) 
.)) 
EnergyCareful)) )
:))) *
return))+ 1
Symbol))2 8
.))8 9
FourBars))9 A
;))A B
case** 
PwIcon** 
.** 
Disk**  
:**  !
return**" (
Symbol**) /
.**/ 0
Save**0 4
;**4 5
case-- 
PwIcon-- 
.-- 
Console-- #
:--# $
return--% +
Symbol--, 2
.--2 3
	SlideShow--3 <
;--< =
case.. 
PwIcon.. 
... 
Printer.. #
:..# $
return..% +
Symbol.., 2
...2 3
Scan..3 7
;..7 8
case// 
PwIcon// 
.// 
ProgramIcons// (
://( )
return//* 0
Symbol//1 7
.//7 8
	GoToStart//8 A
;//A B
case11 
PwIcon11 
.11 
Settings11 $
:11$ %
case22 
PwIcon22 
.22 
Tool22  
:22  !
return22" (
Symbol22) /
.22/ 0
Repair220 6
;226 7
case33 
PwIcon33 
.33 
Archive33 #
:33# $
return33% +
Symbol33, 2
.332 3
Crop333 7
;337 8
case44 
PwIcon44 
.44 
Count44 !
:44! "
return44# )
Symbol44* 0
.440 1

Calculator441 ;
;44; <
case55 
PwIcon55 
.55 
Clock55 !
:55! "
return55# )
Symbol55* 0
.550 1
Clock551 6
;556 7
case66 
PwIcon66 
.66 
EMailSearch66 '
:66' (
return66) /
Symbol660 6
.666 7
Find667 ;
;66; <
case77 
PwIcon77 
.77 
	PaperFlag77 %
:77% &
return77' -
Symbol77. 4
.774 5
Flag775 9
;779 :
case99 
PwIcon99 
.99 
TrashBin99 $
:99$ %
return99& ,
Symbol99- 3
.993 4
Delete994 :
;99: ;
case:: 
PwIcon:: 
.:: 
Expired:: #
:::# $
return::% +
Symbol::, 2
.::2 3
Cancel::3 9
;::9 :
case;; 
PwIcon;; 
.;; 
Info;;  
:;;  !
return;;" (
Symbol;;) /
.;;/ 0
Help;;0 4
;;;4 5
case== 
PwIcon== 
.== 
Folder== "
:==" #
case>> 
PwIcon>> 
.>> 

FolderOpen>> &
:>>& '
case?? 
PwIcon?? 
.?? 
FolderPackage?? )
:??) *
return??+ 1
Symbol??2 8
.??8 9
Folder??9 ?
;??? @
caseAA 
PwIconAA 
.AA 
PaperLockedAA '
:AA' (
returnAA) /
SymbolAA0 6
.AA6 7
ProtectedDocumentAA7 H
;AAH I
caseBB 
PwIconBB 
.BB 
CheckedBB #
:BB# $
returnBB% +
SymbolBB, 2
.BB2 3
AcceptBB3 9
;BB9 :
caseCC 
PwIconCC 
.CC 
PenCC 
:CC  
returnCC! '
SymbolCC( .
.CC. /
EditCC/ 3
;CC3 4
caseDD 
PwIconDD 
.DD 
	ThumbnailDD %
:DD% &
returnDD' -
SymbolDD. 4
.DD4 5
BrowsePhotosDD5 A
;DDA B
caseEE 
PwIconEE 
.EE 
BookEE  
:EE  !
returnEE" (
SymbolEE) /
.EE/ 0
LibraryEE0 7
;EE7 8
caseFF 
PwIconFF 
.FF 
ListFF  
:FF  !
returnFF" (
SymbolFF) /
.FF/ 0
ListFF0 4
;FF4 5
caseGG 
PwIconGG 
.GG 
UserKeyGG #
:GG# $
returnGG% +
SymbolGG, 2
.GG2 3
ContactPresenceGG3 B
;GGB C
caseHH 
PwIconHH 
.HH 
HomeHH  
:HH  !
returnHH" (
SymbolHH) /
.HH/ 0
HomeHH0 4
;HH4 5
caseII 
PwIconII 
.II 
StarII  
:II  !
returnII" (
SymbolII) /
.II/ 0
OutlineStarII0 ;
;II; <
caseNN 
PwIconNN 
.NN 
MoneyNN !
:NN! "
returnNN# )
SymbolNN* 0
.NN0 1
ShopNN1 5
;NN5 6
caseOO 
PwIconOO 
.OO 
CertificateOO '
:OO' (
returnOO) /
SymbolOO0 6
.OO6 7
PreviewLinkOO7 B
;OOB C
casePP 
PwIconPP 
.PP 

BlackBerryPP &
:PP& '
returnPP( .
SymbolPP/ 5
.PP5 6
	CellPhonePP6 ?
;PP? @
defaultQQ 
:QQ 
returnQQ 
SymbolQQ  &
.QQ& '
StopQQ' +
;QQ+ ,
}RR 
}SS 	
publicUU 
objectUU 
ConvertBackUU !
(UU! "
objectUU" (
valueUU) .
,UU. /
TypeUU0 4

targetTypeUU5 ?
,UU? @
objectUUA G
	parameterUUH Q
,UUQ R
stringUUS Y
languageUUZ b
)UUb c
{VV 	
varWW 
symbolWW 
=WW 
(WW 
SymbolWW  
)WW  !
valueWW" '
;WW' (
switchXX 
(XX 
symbolXX 
)XX 
{YY 
casehh 
Symbolhh 
.hh 
Deletehh "
:hh" #
returnii 
PwIconii !
.ii! "
TrashBinii" *
;ii* +
default
�� 
:
�� 
return
�� 
PwIcon
�� !
.
��! "
Folder
��" (
;
��( )
}
�� 
}
�� 	
}
�� 
}�� �
RC:\Sources\Other\ModernKeePass\ModernKeePass\Exceptions\DatabaseOpenedException.cs
	namespace 	
ModernKeePass
 
. 

Exceptions "
{ 
public 

class #
DatabaseOpenedException (
:( )
	Exception* 3
{ 
} 
}		 �
JC:\Sources\Other\ModernKeePass\ModernKeePass\Interfaces\ILicenseService.cs
	namespace 	
ModernKeePass
 
. 

Interfaces "
{ 
public 

	interface 
ILicenseService $
{ 
IReadOnlyDictionary		 
<		 
string		 "
,		" #
ProductListing		$ 2
>		2 3
Products		4 <
{		= >
get		? B
;		B C
}		D E
Task

 
<

 
int

 
>

 
Purchase

 
(

 
string

 !
addOn

" '
)

' (
;

( )
} 
} �
RC:\Sources\Other\ModernKeePass\ModernKeePass\Interfaces\IProxyInvocationHandler.cs
	namespace 	
ModernKeePass
 
. 

Interfaces "
{ 
public 

	interface #
IProxyInvocationHandler ,
{ 
object 
Invoke 
( 
object 
proxy "
," #

MethodInfo$ .
method/ 5
,5 6
object7 =
[= >
]> ?

parameters@ J
)J K
;K L
} 
}		 �
IC:\Sources\Other\ModernKeePass\ModernKeePass\Interfaces\IRecentService.cs
	namespace 	
ModernKeePass
 
. 

Interfaces "
{ 
public 

	interface 
IRecentService #
{ 
int		 

EntryCount		 
{		 
get		 
;		 
}		 
Task

 
<

 
IStorageItem

 
>

 
GetFileAsync

 '
(

' (
string

( .
token

/ 4
)

4 5
;

5 6 
ObservableCollection 
< 
IRecentItem (
>( )
GetAllFiles* 5
(5 6
bool6 :
removeIfNonExistant; N
=O P
trueQ U
)U V
;V W
void 
Add 
( 
IStorageItem 
file "
," #
string$ *
metadata+ 3
)3 4
;4 5
void 
ClearAll 
( 
) 
; 
} 
} �
FC:\Sources\Other\ModernKeePass\ModernKeePass\Interfaces\IRecentItem.cs
	namespace 	
ModernKeePass
 
. 

Interfaces "
{ 
public 

	interface 
IRecentItem  
{ 
StorageFile 
DatabaseFile  
{! "
get# &
;& '
}( )
string 
Token 
{ 
get 
; 
} 
string		 
Name		 
{		 
get		 
;		 
}		 
}

 
} �
KC:\Sources\Other\ModernKeePass\ModernKeePass\Interfaces\IResourceService.cs
	namespace 	
ModernKeePass
 
. 

Interfaces "
{ 
public 

	interface 
IResourceService %
{ 
string 
GetResourceValue 
(  
string  &
key' *
)* +
;+ ,
} 
} �
MC:\Sources\Other\ModernKeePass\ModernKeePass\Services\SingletonServiceBase.cs
	namespace 	
ModernKeePass
 
. 
Services  
{ 
public 

abstract 
class  
SingletonServiceBase .
<. /
T/ 0
>0 1
where2 7
T8 9
:: ;
new< ?
(? @
)@ A
{ 
private 
static 
readonly 
Lazy  $
<$ %
T% &
>& '
LazyInstance( 4
=5 6
new 
Lazy 
< 
T 
> 
( 
( 
) 
=> 
new !
T" #
(# $
)$ %
)% &
;& '
public

 
static

 
T

 
Instance

  
=>

! #
LazyInstance

$ 0
.

0 1
Value

1 6
;

6 7
} 
} �

`C:\Sources\Other\ModernKeePass\ModernKeePass\TemplateSelectors\SelectableDataTemplateSelector.cs
	namespace 	
ModernKeePass
 
. 
TemplateSelectors )
{ 
public 

class *
SelectableDataTemplateSelector /
:/ 0 
DataTemplateSelector1 E
{ 
public		 
DataTemplate		 
TrueItem		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public

 
DataTemplate

 
	FalseItem

 %
{

& '
get

( +
;

+ ,
set

- 0
;

0 1
}

2 3
	protected 
override 
DataTemplate '
SelectTemplateCore( :
(: ;
object; A
itemB F
,F G
DependencyObjectH X
	containerY b
)b c
{ 	
var 
isSelectableItem  
=! "
item# '
as( *
ISelectableModel+ ;
;; <
return 
isSelectableItem #
!=$ &
null' +
&&, .
isSelectableItem/ ?
.? @

IsSelected@ J
?K L
TrueItemM U
:V W
	FalseItemX a
;a b
} 	
} 
} �

OC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\Items\SettingsSaveVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
SettingsSaveVm 
{ 
private 
readonly 
ISettingsService )
	_settings* 3
;3 4
public

 
SettingsSaveVm

 
(

 
)

 
:

  !
this

" &
(

& '
SettingsService

' 6
.

6 7
Instance

7 ?
)

? @
{ 	
}
 
public 
SettingsSaveVm 
( 
ISettingsService .
settings/ 7
)7 8
{ 	
	_settings 
= 
settings  
;  !
} 	
public 
bool 
IsSaveSuspend !
{ 	
get 
{ 
return 
	_settings "
." #

GetSetting# -
(- .
$str. ;
,; <
true= A
)A B
;B C
}D E
set 
{ 
	_settings 
. 

PutSetting &
(& '
$str' 4
,4 5
value6 ;
); <
;< =
}> ?
} 	
} 
} �
TC:\Sources\Other\ModernKeePass\ModernKeePass\Views\MainPageFrames\DonatePage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class 

DonatePage  *
{		 
public

 

DonatePage

 
(

 
)

 
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
} 
} ��
HC:\Sources\Other\ModernKeePass\ModernKeePass\Services\DatabaseService.cs
	namespace 	
ModernKeePass
 
. 
Services  
{ 
public 

class 
DatabaseService  
:  ! 
SingletonServiceBase" 6
<6 7
DatabaseService7 F
>F G
,G H
IDatabaseServiceI Y
{ 
private 
readonly 

PwDatabase #
_pwDatabase$ /
=0 1
new2 5

PwDatabase6 @
(@ A
)A B
;B C
private 
readonly 
ISettingsService )
	_settings* 3
;3 4
private 
StorageFile 
_realDatabaseFile -
;- .
private 
StorageFile 
_databaseFile )
;) *
private 
GroupVm 
_recycleBin #
;# $
private 
CompositeKey 
_compositeKey *
;* +
public 
GroupVm 
	RootGroup  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
GroupVm 

RecycleBin !
{ 	
get 
{ 
return 
_recycleBin $
;$ %
}& '
set   
{!! 
_recycleBin"" 
="" 
value"" #
;""# $
_pwDatabase## 
.## 
RecycleBinUuid## *
=##+ ,
_recycleBin##- 8
?##8 9
.##9 :
IdUuid##: @
;##@ A
}$$ 
}%% 	
public'' 
string'' 
Name'' 
=>'' 
DatabaseFile'' *
?''* +
.''+ ,
Name'', 0
;''0 1
public)) 
bool)) 
RecycleBinEnabled)) %
{** 	
get++ 
{++ 
return++ 
_pwDatabase++ $
.++$ %
RecycleBinEnabled++% 6
;++6 7
}++8 9
set,, 
{,, 
_pwDatabase,, 
.,, 
RecycleBinEnabled,, /
=,,0 1
value,,2 7
;,,7 8
},,9 :
}-- 	
public// 
StorageFile// 
DatabaseFile// '
{00 	
get11 
{11 
return11 
_databaseFile11 &
;11& '
}11( )
set22 
{33 
if44 
(44 
IsOpen44 
&&44 

HasChanged44 (
)44( )
{55 
throw66 
new66 #
DatabaseOpenedException66 5
(665 6
)666 7
;667 8
}77 
_databaseFile88 
=88 
value88  %
;88% &
}99 
}:: 	
public<< 
CompositeKey<< 
CompositeKey<< (
{== 	
get>> 
{>> 
return>> 
_compositeKey>> &
;>>& '
}>>( )
set?? 
{?? 
_compositeKey?? 
=??  !
value??" '
;??' (
}??) *
}@@ 	
publicBB 
PwUuidBB 

DataCipherBB  
{CC 	
getDD 
{DD 
returnDD 
_pwDatabaseDD $
.DD$ %
DataCipherUuidDD% 3
;DD3 4
}DD5 6
setEE 
{EE 
_pwDatabaseEE 
.EE 
DataCipherUuidEE ,
=EE- .
valueEE/ 4
;EE4 5
}EE6 7
}FF 	
publicHH "
PwCompressionAlgorithmHH % 
CompressionAlgorithmHH& :
{II 	
getJJ 
{JJ 
returnJJ 
_pwDatabaseJJ $
.JJ$ %
CompressionJJ% 0
;JJ0 1
}JJ2 3
setKK 
{KK 
_pwDatabaseKK 
.KK 
CompressionKK )
=KK* +
valueKK, 1
;KK1 2
}KK3 4
}LL 	
publicNN 
KdfParametersNN 
KeyDerivationNN *
{OO 	
getPP 
{PP 
returnPP 
_pwDatabasePP $
.PP$ %
KdfParametersPP% 2
;PP2 3
}PP4 5
setQQ 
{QQ 
_pwDatabaseQQ 
.QQ 
KdfParametersQQ +
=QQ, -
valueQQ. 3
;QQ3 4
}QQ5 6
}RR 	
publicTT 
boolTT 
IsOpenTT 
=>TT 
_pwDatabaseTT )
.TT) *
IsOpenTT* 0
;TT0 1
publicUU 
boolUU 

IsFileOpenUU 
=>UU !
!UU" #
_pwDatabaseUU# .
.UU. /
IsOpenUU/ 5
&&UU6 8
_databaseFileUU9 F
!=UUG I
nullUUJ N
;UUN O
publicVV 
boolVV 
IsClosedVV 
=>VV 
_databaseFileVV  -
==VV. 0
nullVV1 5
;VV5 6
publicWW 
boolWW 

HasChangedWW 
{WW  
getWW! $
;WW$ %
setWW& )
;WW) *
}WW+ ,
publicYY 
DatabaseServiceYY 
(YY 
)YY  
:YY! "
thisYY# '
(YY' (
SettingsServiceYY( 7
.YY7 8
InstanceYY8 @
)YY@ A
{ZZ 	
}[[ 	
public]] 
DatabaseService]] 
(]] 
ISettingsService]] /
settings]]0 8
)]]8 9
{^^ 	
	_settings__ 
=__ 
settings__  
;__  !
}`` 	
publicii 
asyncii 
Taskii 
Openii 
(ii 
CompositeKeyii +
keyii, /
,ii/ 0
boolii1 5
	createNewii6 ?
=ii@ A
falseiiB G
)iiG H
{jj 	
tryll 
{mm 
ifnn 
(nn 
keynn 
==nn 
nullnn 
)nn  
{oo 
throwpp 
newpp !
ArgumentNullExceptionpp 3
(pp3 4
nameofpp4 :
(pp: ;
keypp; >
)pp> ?
)pp? @
;pp@ A
}qq 
_compositeKeyss 
=ss 
keyss  #
;ss# $
vartt 
ioConnectiontt  
=tt! "
IOConnectionInfott# 3
.tt3 4
FromFilett4 <
(tt< =
DatabaseFilett= I
)ttI J
;ttJ K
ifuu 
(uu 
	createNewuu 
)uu 
{vv 
_pwDatabaseww 
.ww  
Newww  #
(ww# $
ioConnectionww$ 0
,ww0 1
keyww2 5
)ww5 6
;ww6 7
ifzz 
(zz 
	_settingszz !
.zz! "

GetSettingzz" ,
<zz, -
boolzz- 1
>zz1 2
(zz2 3
$strzz3 ;
)zz; <
)zz< =
CreateSampleDatazz> N
(zzN O
)zzO P
;zzP Q
var{{ 

fileFormat{{ "
={{# $
	_settings{{% .
.{{. /

GetSetting{{/ 9
<{{9 :
string{{: @
>{{@ A
({{A B
$str{{B U
){{U V
;{{V W
switch|| 
(|| 

fileFormat|| &
)||& '
{}} 
case~~ 
$str~~  
:~~  !
KeyDerivation )
=* +
KdfPool, 3
.3 4
Get4 7
(7 8
$str8 @
)@ A
.A B 
GetDefaultParametersB V
(V W
)W X
;X Y
break
�� !
;
��! "
}
�� 
}
�� 
else
�� 
_pwDatabase
��  
.
��  !
Open
��! %
(
��% &
ioConnection
��& 2
,
��2 3
key
��4 7
,
��7 8
new
��9 <
NullStatusLogger
��= M
(
��M N
)
��N O
)
��O P
;
��P Q
if
�� 
(
�� 
	_settings
�� 
.
�� 

GetSetting
�� (
<
��( )
bool
��) -
>
��- .
(
��. /
$str
��/ ?
)
��? @
)
��@ A
{
�� 
_realDatabaseFile
�� %
=
��& '
_databaseFile
��( 5
;
��5 6
var
�� 

backupFile
�� "
=
��# $
await
�� 
ApplicationData
�� -
.
��- .
Current
��. 5
.
��5 6
RoamingFolder
��6 C
.
��C D
CreateFileAsync
��D S
(
��S T
Name
��T X
,
��X Y%
CreationCollisionOption
�� 3
.
��3 4
FailIfExists
��4 @
)
��@ A
;
��A B
Save
�� 
(
�� 

backupFile
�� #
)
��# $
;
��$ %
}
�� 
	RootGroup
�� 
=
�� 
new
�� 
GroupVm
��  '
(
��' (
_pwDatabase
��( 3
.
��3 4
	RootGroup
��4 =
,
��= >
null
��? C
,
��C D
RecycleBinEnabled
��E V
?
��W X
_pwDatabase
��Y d
.
��d e
RecycleBinUuid
��e s
:
��t u
null
��v z
)
��z {
;
��{ |
}
�� 
catch
�� 
(
�� *
InvalidCompositeKeyException
�� /
ex
��0 2
)
��2 3
{
�� 
HockeyClient
�� 
.
�� 
Current
�� $
.
��$ %
TrackException
��% 3
(
��3 4
ex
��4 6
)
��6 7
;
��7 8
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
ex
��, .
.
��. /
Message
��/ 6
,
��6 7
ex
��8 :
)
��: ;
;
��; <
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
ReOpen
��  
(
��  !
)
��! "
{
�� 	
await
�� 
Open
�� 
(
�� 
_compositeKey
�� $
)
��$ %
;
��% &
}
�� 	
public
�� 
void
�� 
Save
�� 
(
�� 
)
�� 
{
�� 	
if
�� 
(
�� 
!
�� 
IsOpen
�� 
)
�� 
return
�� 
;
��  
try
�� 
{
�� 
_pwDatabase
�� 
.
�� 
Save
��  
(
��  !
new
��! $
NullStatusLogger
��% 5
(
��5 6
)
��6 7
)
��7 8
;
��8 9
if
�� 
(
�� 
	_settings
�� 
.
�� 

GetSetting
�� (
<
��( )
bool
��) -
>
��- .
(
��. /
$str
��/ ?
)
��? @
)
��@ A
{
�� 
_pwDatabase
�� 
.
��  
Open
��  $
(
��$ %
_pwDatabase
��% 0
.
��0 1
IOConnectionInfo
��1 A
,
��A B
_pwDatabase
��C N
.
��N O
	MasterKey
��O X
,
��X Y
new
��Z ]
NullStatusLogger
��^ n
(
��n o
)
��o p
)
��p q
;
��q r
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
SaveException
�� '
(
��' (
e
��( )
)
��) *
;
��* +
}
�� 
}
�� 	
public
�� 
void
�� 
Save
�� 
(
�� 
StorageFile
�� $
file
��% )
)
��) *
{
�� 	
var
�� 
oldFile
�� 
=
�� 
DatabaseFile
�� &
;
��& '
DatabaseFile
�� 
=
�� 
file
�� 
;
��  
try
�� 
{
�� 
_pwDatabase
�� 
.
�� 
SaveAs
�� "
(
��" #
IOConnectionInfo
��# 3
.
��3 4
FromFile
��4 <
(
��< =
DatabaseFile
��= I
)
��I J
,
��J K
true
��L P
,
��P Q
new
��R U
NullStatusLogger
��V f
(
��f g
)
��g h
)
��h i
;
��i j
}
�� 
catch
�� 
{
�� 
DatabaseFile
�� 
=
�� 
oldFile
�� &
;
��& '
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
Close
�� 
(
��  
bool
��  $
releaseFile
��% 0
=
��1 2
true
��3 7
)
��7 8
{
�� 	
_pwDatabase
�� 
?
�� 
.
�� 
Close
�� 
(
�� 
)
��  
;
��  !
if
�� 
(
�� 
	_settings
�� 
.
�� 

GetSetting
�� $
<
��$ %
bool
��% )
>
��) *
(
��* +
$str
��+ ;
)
��; <
)
��< =
{
�� 
if
�� 
(
�� 
_pwDatabase
�� 
!=
��  "
null
��# '
&&
��( *
_pwDatabase
��+ 6
.
��6 7
Modified
��7 ?
)
��? @
Save
�� 
(
�� 
_realDatabaseFile
�� *
)
��* +
;
��+ ,
await
�� 
DatabaseFile
�� "
.
��" #
DeleteAsync
��# .
(
��. /
)
��/ 0
;
��0 1
}
�� 
if
�� 
(
�� 
releaseFile
�� 
)
�� 
DatabaseFile
�� )
=
��* +
null
��, 0
;
��0 1
}
�� 	
public
�� 
void
�� 
AddDeletedItem
�� "
(
��" #
PwUuid
��# )
id
��* ,
)
��, -
{
�� 	
_pwDatabase
�� 
.
�� 
DeletedObjects
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
PwDeletedObject
��/ >
(
��> ?
id
��? A
,
��A B
DateTime
��C K
.
��K L
UtcNow
��L R
)
��R S
)
��S T
;
��T U
}
�� 	
public
�� 
void
�� 
CreateRecycleBin
�� $
(
��$ %
string
��% +
title
��, 1
)
��1 2
{
�� 	

RecycleBin
�� 
=
�� 
	RootGroup
�� "
.
��" #
AddNewGroup
��# .
(
��. /
title
��/ 4
)
��4 5
;
��5 6

RecycleBin
�� 
.
�� 

IsSelected
�� !
=
��" #
true
��$ (
;
��( )

RecycleBin
�� 
.
�� 
IconId
�� 
=
�� 
(
��  !
int
��! $
)
��$ %
PwIcon
��% +
.
��+ ,
TrashBin
��, 4
;
��4 5
}
�� 	
private
�� 
void
�� 
CreateSampleData
�� %
(
��% &
)
��& '
{
�� 	
_pwDatabase
�� 
.
�� 
	RootGroup
�� !
.
��! "
AddGroup
��" *
(
��* +
new
��+ .
PwGroup
��/ 6
(
��6 7
true
��7 ;
,
��; <
true
��= A
,
��A B
$str
��C L
,
��L M
PwIcon
��N T
.
��T U
Count
��U Z
)
��Z [
,
��[ \
true
��] a
)
��a b
;
��b c
_pwDatabase
�� 
.
�� 
	RootGroup
�� !
.
��! "
AddGroup
��" *
(
��* +
new
��+ .
PwGroup
��/ 6
(
��6 7
true
��7 ;
,
��; <
true
��= A
,
��A B
$str
��C J
,
��J K
PwIcon
��L R
.
��R S
EMail
��S X
)
��X Y
,
��Y Z
true
��[ _
)
��_ `
;
��` a
_pwDatabase
�� 
.
�� 
	RootGroup
�� !
.
��! "
AddGroup
��" *
(
��* +
new
��+ .
PwGroup
��/ 6
(
��6 7
true
��7 ;
,
��; <
true
��= A
,
��A B
$str
��C M
,
��M N
PwIcon
��O U
.
��U V
World
��V [
)
��[ \
,
��\ ]
true
��^ b
)
��b c
;
��c d
var
�� 
pe
�� 
=
�� 
new
�� 
PwEntry
��  
(
��  !
true
��! %
,
��% &
true
��' +
)
��+ ,
;
��, -
pe
�� 
.
�� 
Strings
�� 
.
�� 
Set
�� 
(
�� 
PwDefs
�� !
.
��! "

TitleField
��" ,
,
��, -
new
��. 1
ProtectedString
��2 A
(
��A B
_pwDatabase
��B M
.
��M N
MemoryProtection
��N ^
.
��^ _
ProtectTitle
��_ k
,
��k l
$str
�� 
)
�� 
)
��  
;
��  !
pe
�� 
.
�� 
Strings
�� 
.
�� 
Set
�� 
(
�� 
PwDefs
�� !
.
��! "
UserNameField
��" /
,
��/ 0
new
��1 4
ProtectedString
��5 D
(
��D E
_pwDatabase
��E P
.
��P Q
MemoryProtection
��Q a
.
��a b
ProtectUserName
��b q
,
��q r
$str
�� 
)
�� 
)
�� 
;
�� 
pe
�� 
.
�� 
Strings
�� 
.
�� 
Set
�� 
(
�� 
PwDefs
�� !
.
��! "
UrlField
��" *
,
��* +
new
��, /
ProtectedString
��0 ?
(
��? @
_pwDatabase
��@ K
.
��K L
MemoryProtection
��L \
.
��\ ]

ProtectUrl
��] g
,
��g h
PwDefs
�� 
.
�� 
HomepageUrl
�� "
)
��" #
)
��# $
;
��$ %
pe
�� 
.
�� 
Strings
�� 
.
�� 
Set
�� 
(
�� 
PwDefs
�� !
.
��! "
PasswordField
��" /
,
��/ 0
new
��1 4
ProtectedString
��5 D
(
��D E
_pwDatabase
��E P
.
��P Q
MemoryProtection
��Q a
.
��a b
ProtectPassword
��b q
,
��q r
$str
�� 
)
�� 
)
�� 
;
�� 
pe
�� 
.
�� 
Strings
�� 
.
�� 
Set
�� 
(
�� 
PwDefs
�� !
.
��! "

NotesField
��" ,
,
��, -
new
��. 1
ProtectedString
��2 A
(
��A B
_pwDatabase
��B M
.
��M N
MemoryProtection
��N ^
.
��^ _
ProtectNotes
��_ k
,
��k l
$str
�� 3
)
��3 4
)
��4 5
;
��5 6
_pwDatabase
�� 
.
�� 
	RootGroup
�� !
.
��! "
AddEntry
��" *
(
��* +
pe
��+ -
,
��- .
true
��/ 3
)
��3 4
;
��4 5
pe
�� 
=
�� 
new
�� 
PwEntry
�� 
(
�� 
true
�� !
,
��! "
true
��# '
)
��' (
;
��( )
pe
�� 
.
�� 
Strings
�� 
.
�� 
Set
�� 
(
�� 
PwDefs
�� !
.
��! "

TitleField
��" ,
,
��, -
new
��. 1
ProtectedString
��2 A
(
��A B
_pwDatabase
��B M
.
��M N
MemoryProtection
��N ^
.
��^ _
ProtectTitle
��_ k
,
��k l
$str
�� !
)
��! "
)
��" #
;
��# $
pe
�� 
.
�� 
Strings
�� 
.
�� 
Set
�� 
(
�� 
PwDefs
�� !
.
��! "
UserNameField
��" /
,
��/ 0
new
��1 4
ProtectedString
��5 D
(
��D E
_pwDatabase
��E P
.
��P Q
MemoryProtection
��Q a
.
��a b
ProtectUserName
��b q
,
��q r
$str
�� 
)
�� 
)
�� 
;
�� 
pe
�� 
.
�� 
Strings
�� 
.
�� 
Set
�� 
(
�� 
PwDefs
�� !
.
��! "
UrlField
��" *
,
��* +
new
��, /
ProtectedString
��0 ?
(
��? @
_pwDatabase
��@ K
.
��K L
MemoryProtection
��L \
.
��\ ]

ProtectUrl
��] g
,
��g h
PwDefs
�� 
.
�� 
HelpUrl
�� 
+
��  
$str
��! 3
)
��3 4
)
��4 5
;
��5 6
pe
�� 
.
�� 
Strings
�� 
.
�� 
Set
�� 
(
�� 
PwDefs
�� !
.
��! "
PasswordField
��" /
,
��/ 0
new
��1 4
ProtectedString
��5 D
(
��D E
_pwDatabase
��E P
.
��P Q
MemoryProtection
��Q a
.
��a b
ProtectPassword
��b q
,
��q r
$str
�� 
)
�� 
)
�� 
;
�� 
pe
�� 
.
�� 
AutoType
�� 
.
�� 
Add
�� 
(
�� 
new
�� !
AutoTypeAssociation
��  3
(
��3 4
$str
��4 K
,
��K L
string
��M S
.
��S T
Empty
��T Y
)
��Y Z
)
��Z [
;
��[ \
_pwDatabase
�� 
.
�� 
	RootGroup
�� !
.
��! "
AddEntry
��" *
(
��* +
pe
��+ -
,
��- .
true
��/ 3
)
��3 4
;
��4 5
}
�� 	
}
�� 
}�� �
KC:\Sources\Other\ModernKeePass\ModernKeePass\Interfaces\ISettingsService.cs
	namespace 	
ModernKeePass
 
. 

Interfaces "
{ 
public 

	interface 
ISettingsService %
{ 
T 	

GetSetting
 
< 
T 
> 
( 
string 
property '
,' (
T) *
defaultValue+ 7
=8 9
default: A
(A B
TB C
)C D
)D E
;E F
void 

PutSetting 
< 
T 
> 
( 
string !
property" *
,* +
T, -
value. 3
)3 4
;4 5
} 
} �8
JC:\Sources\Other\ModernKeePass\ModernKeePass\Common\MessageDialogHelper.cs
	namespace 	
ModernKeePass
 
. 
Common 
{		 
public

 

static

 
class

 
MessageDialogHelper

 +
{ 
public 
static 
async 
void  
ShowActionDialog! 1
(1 2
string2 8
title9 >
,> ?
string@ F
contentTextG R
,R S
stringT Z
actionButtonText[ k
,k l
stringm s
cancelButtonText	t �
,
� �%
UICommandInvokedHandler
� �
actionCommand
� �
,
� �%
UICommandInvokedHandler
� �
cancelCommand
� �
)
� �
{ 	
var 
messageDialog 
= 
CreateBasicDialog  1
(1 2
title2 7
,7 8
contentText9 D
,D E
cancelButtonTextF V
,V W
cancelCommandX e
)e f
;f g
messageDialog 
. 
Commands "
." #
Add# &
(& '
new' *
	UICommand+ 4
(4 5
actionButtonText5 E
,E F
actionCommandG T
)T U
)U V
;V W
await 
messageDialog 
.  
	ShowAsync  )
() *
)* +
;+ ,
} 	
public 
static 
void 
SaveErrorDialog *
(* +
SaveException+ 8
	exception9 B
,B C
IDatabaseServiceD T
databaseU ]
)] ^
{ 	
ShowActionDialog 
( 
$str )
,) *
	exception+ 4
.4 5
InnerException5 C
.C D
MessageD K
,K L
$strM V
,V W
$strX a
,a b
asyncc h
commandi p
=>q s
{ 
var 

savePicker 
=  
new! $
FileSavePicker% 3
{ "
SuggestedStartLocation *
=+ ,
PickerLocationId- =
.= >
DocumentsLibrary> N
,N O
SuggestedFileName   %
=  & '
$"  ( *
{  * +
database  + 3
.  3 4
DatabaseFile  4 @
.  @ A
DisplayName  A L
}  L M
 - copy  M T
"  T U
}!! 
;!! 

savePicker"" 
."" 
FileTypeChoices"" *
.""* +
Add""+ .
("". /
$str""/ E
,""E F
new""G J
List""K O
<""O P
string""P V
>""V W
{""X Y
$str""Z a
}""b c
)""c d
;""d e
var$$ 
file$$ 
=$$ 
await$$  

savePicker$$! +
.$$+ ,
PickSaveFileAsync$$, =
($$= >
)$$> ?
;$$? @
if%% 
(%% 
file%% 
!=%% 
null%%  
)%%  !
database%%" *
.%%* +
Save%%+ /
(%%/ 0
file%%0 4
)%%4 5
;%%5 6
}&& 
,&& 
null&& 
)&& 
;&& 
}'' 	
public)) 
static)) 
void)) 
SaveUnchangedDialog)) .
()). /#
DatabaseOpenedException))/ F
	exception))G P
,))P Q
IDatabaseService))R b
database))c k
)))k l
{** 	
ShowActionDialog++ 
(++ 
$str++ .
,++. /
$"++0 2
	Database ++2 ;
{++; <
database++< D
.++D E
Name++E I
}++I J9
- is currently opened. What to you wish to do?++J w
"++w x
,++x y
$str	++z �
,
++� �
$str
++� �
,
++� �
command
++� �
=>
++� �
{,, 
database-- 
.-- 
Save-- 
(-- 
)-- 
;--  
database.. 
... 
Close.. 
(.. 
)..  
;..  !
}// 
,// 
command00 
=>00 
{11 
database22 
.22 
Close22 
(22 
)22  
;22  !
}33 
)33 
;33 
}44 	
public66 
static66 
async66 
void66  
ShowErrorDialog66! 0
(660 1
	Exception661 :
	exception66; D
)66D E
{77 	
if88 
(88 
	exception88 
==88 
null88 !
)88! "
return88# )
;88) *
var:: 
messageDialog:: 
=:: 
CreateBasicDialog::  1
(::1 2
	exception::2 ;
.::; <
Message::< C
,::C D
	exception::E N
.::N O

StackTrace::O Y
,::Y Z
$str::[ _
)::_ `
;::` a
await== 
messageDialog== 
.==  
	ShowAsync==  )
(==) *
)==* +
;==+ ,
}>> 	
public@@ 
static@@ 
async@@ 
void@@  "
ShowNotificationDialog@@! 7
(@@7 8
string@@8 >
title@@? D
,@@D E
string@@F L
message@@M T
)@@T U
{AA 	
varBB 
dialogBB 
=BB 
CreateBasicDialogBB *
(BB* +
titleBB+ 0
,BB0 1
messageBB2 9
,BB9 :
$strBB; ?
)BB? @
;BB@ A
awaitEE 
dialogEE 
.EE 
	ShowAsyncEE "
(EE" #
)EE# $
;EE$ %
}FF 	
privateHH 
staticHH 
MessageDialogHH $
CreateBasicDialogHH% 6
(HH6 7
stringHH7 =
titleHH> C
,HHC D
stringHHE K
messageHHL S
,HHS T
stringHHU [
dismissActionTextHH\ m
,HHm n$
UICommandInvokedHandler	HHo �
cancelCommand
HH� �
=
HH� �
null
HH� �
)
HH� �
{II 	
varKK 
messageDialogKK 
=KK 
newKK  #
MessageDialogKK$ 1
(KK1 2
messageKK2 9
,KK9 :
titleKK; @
)KK@ A
;KKA B
messageDialogNN 
.NN 
CommandsNN "
.NN" #
AddNN# &
(NN& '
newNN' *
	UICommandNN+ 4
(NN4 5
dismissActionTextNN5 F
,NNF G
cancelCommandNNH U
)NNU V
)NNV W
;NNW X
messageDialogQQ 
.QQ 
DefaultCommandIndexQQ -
=QQ. /
$numQQ0 1
;QQ1 2
messageDialogTT 
.TT 
CancelCommandIndexTT ,
=TT- .
$numTT/ 0
;TT0 1
returnVV 
messageDialogVV  
;VV  !
}WW 	
}XX 
}YY ��
GC:\Sources\Other\ModernKeePass\ModernKeePass\Common\NavigationHelper.cs
	namespace 	
ModernKeePass
 
. 
Common 
{ 
[;; 
Windows;; 
.;; 

Foundation;; 
.;; 
Metadata;;  
.;;  !
WebHostHidden;;! .
];;. /
public<< 

class<< 
NavigationHelper<< !
:<<" #
DependencyObject<<$ 4
{== 
private>> 
Page>> 
Page>> 
{>> 
get>> 
;>>  
set>>! $
;>>$ %
}>>& '
private?? 
Frame?? 
Frame?? 
{?? 
get?? !
{??" #
return??$ *
this??+ /
.??/ 0
Page??0 4
.??4 5
Frame??5 :
;??: ;
}??< =
}??> ?
publicGG 
NavigationHelperGG 
(GG  
PageGG  $
pageGG% )
)GG) *
{HH 	
thisII 
.II 
PageII 
=II 
pageII 
;II 
thisNN 
.NN 
PageNN 
.NN 
LoadedNN 
+=NN 
(NN  !
senderNN! '
,NN' (
eNN) *
)NN* +
=>NN, .
{OO 
ifTT 
(TT 
thisTT 
.TT 
PageTT 
.TT 
ActualHeightTT *
==TT+ -
WindowTT. 4
.TT4 5
CurrentTT5 <
.TT< =
BoundsTT= C
.TTC D
HeightTTD J
&&TTK M
thisUU 
.UU 
PageUU 
.UU 
ActualWidthUU )
==UU* ,
WindowUU- 3
.UU3 4
CurrentUU4 ;
.UU; <
BoundsUU< B
.UUB C
WidthUUC H
)UUH I
{VV 
WindowXX 
.XX 
CurrentXX "
.XX" #

CoreWindowXX# -
.XX- .

DispatcherXX. 8
.XX8 9#
AcceleratorKeyActivatedXX9 P
+=XXQ S2
&CoreDispatcher_AcceleratorKeyActivatedYY >
;YY> ?
WindowZZ 
.ZZ 
CurrentZZ "
.ZZ" #

CoreWindowZZ# -
.ZZ- .
PointerPressedZZ. <
+=ZZ= ?
this[[ 
.[[ %
CoreWindow_PointerPressed[[ 6
;[[6 7
}\\ 
}^^ 
;^^ 
thisaa 
.aa 
Pageaa 
.aa 
Unloadedaa 
+=aa !
(aa" #
senderaa# )
,aa) *
eaa+ ,
)aa, -
=>aa. 0
{bb 
Windowff 
.ff 
Currentff 
.ff 

CoreWindowff )
.ff) *

Dispatcherff* 4
.ff4 5#
AcceleratorKeyActivatedff5 L
-=ffM O2
&CoreDispatcher_AcceleratorKeyActivatedgg :
;gg: ;
Windowhh 
.hh 
Currenthh 
.hh 

CoreWindowhh )
.hh) *
PointerPressedhh* 8
-=hh9 ;
thisii 
.ii %
CoreWindow_PointerPressedii 2
;ii2 3
}kk 
;kk 
}ll 	
RelayCommandpp 
_goBackCommandpp #
;pp# $
RelayCommandqq 
_goForwardCommandqq &
;qq& '
public{{ 
RelayCommand{{ 
GoBackCommand{{ )
{|| 	
get}} 
{~~ 
if 
( 
_goBackCommand "
==# %
null& *
)* +
{
�� 
_goBackCommand
�� "
=
��# $
new
��% (
RelayCommand
��) 5
(
��5 6
(
�� 
)
�� 
=>
�� 
this
�� "
.
��" #
GoBack
��# )
(
��) *
)
��* +
,
��+ ,
(
�� 
)
�� 
=>
�� 
this
�� "
.
��" #
	CanGoBack
��# ,
(
��, -
)
��- .
)
��. /
;
��/ 0
}
�� 
return
�� 
_goBackCommand
�� %
;
��% &
}
�� 
set
�� 
{
�� 
_goBackCommand
�� 
=
��  
value
��! &
;
��& '
}
�� 
}
�� 	
public
�� 
RelayCommand
�� 
GoForwardCommand
�� ,
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
_goForwardCommand
�� %
==
��& (
null
��) -
)
��- .
{
�� 
_goForwardCommand
�� %
=
��& '
new
��( +
RelayCommand
��, 8
(
��8 9
(
�� 
)
�� 
=>
�� 
this
�� "
.
��" #
	GoForward
��# ,
(
��, -
)
��- .
,
��. /
(
�� 
)
�� 
=>
�� 
this
�� "
.
��" #
CanGoForward
��# /
(
��/ 0
)
��0 1
)
��1 2
;
��2 3
}
�� 
return
�� 
_goForwardCommand
�� (
;
��( )
}
�� 
}
�� 	
public
�� 
virtual
�� 
bool
�� 
	CanGoBack
�� %
(
��% &
)
��& '
{
�� 	
return
�� 
this
�� 
.
�� 
Frame
�� 
!=
��  
null
��! %
&&
��& (
this
��) -
.
��- .
Frame
��. 3
.
��3 4
	CanGoBack
��4 =
;
��= >
}
�� 	
public
�� 
virtual
�� 
bool
�� 
CanGoForward
�� (
(
��( )
)
��) *
{
�� 	
return
�� 
this
�� 
.
�� 
Frame
�� 
!=
��  
null
��! %
&&
��& (
this
��) -
.
��- .
Frame
��. 3
.
��3 4
CanGoForward
��4 @
;
��@ A
}
�� 	
public
�� 
virtual
�� 
void
�� 
GoBack
�� "
(
��" #
)
��# $
{
�� 	
if
�� 
(
�� 
this
�� 
.
�� 
Frame
�� 
!=
�� 
null
�� "
&&
��# %
this
��& *
.
��* +
Frame
��+ 0
.
��0 1
	CanGoBack
��1 :
)
��: ;
this
��< @
.
��@ A
Frame
��A F
.
��F G
GoBack
��G M
(
��M N
)
��N O
;
��O P
}
�� 	
public
�� 
virtual
�� 
void
�� 
	GoForward
�� %
(
��% &
)
��& '
{
�� 	
if
�� 
(
�� 
this
�� 
.
�� 
Frame
�� 
!=
�� 
null
�� "
&&
��# %
this
��& *
.
��* +
Frame
��+ 0
.
��0 1
CanGoForward
��1 =
)
��= >
this
��? C
.
��C D
Frame
��D I
.
��I J
	GoForward
��J S
(
��S T
)
��T U
;
��U V
}
�� 	
private
�� 
void
�� 4
&CoreDispatcher_AcceleratorKeyActivated
�� ;
(
��; <
CoreDispatcher
��< J
sender
��K Q
,
��Q R%
AcceleratorKeyEventArgs
�� #
e
��$ %
)
��% &
{
�� 	
var
�� 

virtualKey
�� 
=
�� 
e
�� 
.
�� 

VirtualKey
�� )
;
��) *
if
�� 
(
�� 
(
�� 
e
�� 
.
�� 
	EventType
�� 
==
�� )
CoreAcceleratorKeyEventType
��  ;
.
��; <
SystemKeyDown
��< I
||
��J L
e
�� 
.
�� 
	EventType
�� 
==
�� )
CoreAcceleratorKeyEventType
�� :
.
��: ;
KeyDown
��; B
)
��B C
&&
��D F
(
�� 

virtualKey
�� 
==
�� 

VirtualKey
�� )
.
��) *
Left
��* .
||
��/ 1

virtualKey
��2 <
==
��= ?

VirtualKey
��@ J
.
��J K
Right
��K P
||
��Q S
(
�� 
int
�� 
)
�� 

virtualKey
�� 
==
��  "
$num
��# &
||
��' )
(
��* +
int
��+ .
)
��. /

virtualKey
��/ 9
==
��: <
$num
��= @
)
��@ A
)
��A B
{
�� 
var
�� 

coreWindow
�� 
=
��  
Window
��! '
.
��' (
Current
��( /
.
��/ 0

CoreWindow
��0 :
;
��: ;
var
�� 
	downState
�� 
=
�� "
CoreVirtualKeyStates
��  4
.
��4 5
Down
��5 9
;
��9 :
bool
�� 
menuKey
�� 
=
�� 
(
��  

coreWindow
��  *
.
��* +
GetKeyState
��+ 6
(
��6 7

VirtualKey
��7 A
.
��A B
Menu
��B F
)
��F G
&
��H I
	downState
��J S
)
��S T
==
��U W
	downState
��X a
;
��a b
bool
�� 

controlKey
�� 
=
��  !
(
��" #

coreWindow
��# -
.
��- .
GetKeyState
��. 9
(
��9 :

VirtualKey
��: D
.
��D E
Control
��E L
)
��L M
&
��N O
	downState
��P Y
)
��Y Z
==
��[ ]
	downState
��^ g
;
��g h
bool
�� 
shiftKey
�� 
=
�� 
(
��  !

coreWindow
��! +
.
��+ ,
GetKeyState
��, 7
(
��7 8

VirtualKey
��8 B
.
��B C
Shift
��C H
)
��H I
&
��J K
	downState
��L U
)
��U V
==
��W Y
	downState
��Z c
;
��c d
bool
�� 
noModifiers
��  
=
��! "
!
��# $
menuKey
��$ +
&&
��, .
!
��/ 0

controlKey
��0 :
&&
��; =
!
��> ?
shiftKey
��? G
;
��G H
bool
�� 
onlyAlt
�� 
=
�� 
menuKey
�� &
&&
��' )
!
��* +

controlKey
��+ 5
&&
��6 8
!
��9 :
shiftKey
��: B
;
��B C
if
�� 
(
�� 
(
�� 
(
�� 
int
�� 
)
�� 

virtualKey
�� $
==
��% '
$num
��( +
&&
��, .
noModifiers
��/ :
)
��: ;
||
��< >
(
�� 

virtualKey
�� 
==
��  "

VirtualKey
��# -
.
��- .
Left
��. 2
&&
��3 5
onlyAlt
��6 =
)
��= >
)
��> ?
{
�� 
e
�� 
.
�� 
Handled
�� 
=
�� 
true
��  $
;
��$ %
this
�� 
.
�� 
GoBackCommand
�� &
.
��& '
Execute
��' .
(
��. /
null
��/ 3
)
��3 4
;
��4 5
}
�� 
else
�� 
if
�� 
(
�� 
(
�� 
(
�� 
int
�� 
)
�� 

virtualKey
�� )
==
��* ,
$num
��- 0
&&
��1 3
noModifiers
��4 ?
)
��? @
||
��A C
(
�� 

virtualKey
�� 
==
��  "

VirtualKey
��# -
.
��- .
Right
��. 3
&&
��4 6
onlyAlt
��7 >
)
��> ?
)
��? @
{
�� 
e
�� 
.
�� 
Handled
�� 
=
�� 
true
��  $
;
��$ %
this
�� 
.
�� 
GoForwardCommand
�� )
.
��) *
Execute
��* 1
(
��1 2
null
��2 6
)
��6 7
;
��7 8
}
�� 
}
�� 
}
�� 	
private
�� 
void
�� '
CoreWindow_PointerPressed
�� .
(
��. /

CoreWindow
��/ 9
sender
��: @
,
��@ A
PointerEventArgs
�� 
e
�� 
)
�� 
{
�� 	
var
�� 

properties
�� 
=
�� 
e
�� 
.
�� 
CurrentPoint
�� +
.
��+ ,

Properties
��, 6
;
��6 7
if
�� 
(
�� 

properties
�� 
.
�� !
IsLeftButtonPressed
�� .
||
��/ 1

properties
��2 <
.
��< ="
IsRightButtonPressed
��= Q
||
��R T

properties
�� 
.
�� #
IsMiddleButtonPressed
�� 0
)
��0 1
return
��2 8
;
��8 9
bool
�� 
backPressed
�� 
=
�� 

properties
�� )
.
��) *
IsXButton1Pressed
��* ;
;
��; <
bool
�� 
forwardPressed
�� 
=
��  !

properties
��" ,
.
��, -
IsXButton2Pressed
��- >
;
��> ?
if
�� 
(
�� 
backPressed
�� 
^
�� 
forwardPressed
�� ,
)
��, -
{
�� 
e
�� 
.
�� 
Handled
�� 
=
�� 
true
��  
;
��  !
if
�� 
(
�� 
backPressed
�� 
)
��  
this
��! %
.
��% &
GoBackCommand
��& 3
.
��3 4
Execute
��4 ;
(
��; <
null
��< @
)
��@ A
;
��A B
if
�� 
(
�� 
forwardPressed
�� "
)
��" #
this
��$ (
.
��( )
GoForwardCommand
��) 9
.
��9 :
Execute
��: A
(
��A B
null
��B F
)
��F G
;
��G H
}
�� 
}
�� 	
private
�� 
String
�� 
_pageKey
�� 
;
��  
public
�� 
event
�� #
LoadStateEventHandler
�� *
	LoadState
��+ 4
;
��4 5
public
�� 
event
�� #
SaveStateEventHandler
�� *
	SaveState
��+ 4
;
��4 5
public
�� 
void
�� 
OnNavigatedTo
�� !
(
��! "!
NavigationEventArgs
��" 5
e
��6 7
)
��7 8
{
�� 	
var
�� 

frameState
�� 
=
�� 
SuspensionManager
�� .
.
��. /"
SessionStateForFrame
��/ C
(
��C D
this
��D H
.
��H I
Frame
��I N
)
��N O
;
��O P
this
�� 
.
�� 
_pageKey
�� 
=
�� 
$str
�� #
+
��$ %
this
��& *
.
��* +
Frame
��+ 0
.
��0 1
BackStackDepth
��1 ?
;
��? @
if
�� 
(
�� 
e
�� 
.
�� 
NavigationMode
��  
==
��! #
NavigationMode
��$ 2
.
��2 3
New
��3 6
)
��6 7
{
�� 
var
�� 
nextPageKey
�� 
=
��  !
this
��" &
.
��& '
_pageKey
��' /
;
��/ 0
int
�� 
nextPageIndex
�� !
=
��" #
this
��$ (
.
��( )
Frame
��) .
.
��. /
BackStackDepth
��/ =
;
��= >
while
�� 
(
�� 

frameState
�� !
.
��! "
Remove
��" (
(
��( )
nextPageKey
��) 4
)
��4 5
)
��5 6
{
�� 
nextPageIndex
�� !
++
��! #
;
��# $
nextPageKey
�� 
=
��  !
$str
��" )
+
��* +
nextPageIndex
��, 9
;
��9 :
}
�� 
if
�� 
(
�� 
this
�� 
.
�� 
	LoadState
�� "
!=
��# %
null
��& *
)
��* +
{
�� 
this
�� 
.
�� 
	LoadState
�� "
(
��" #
this
��# '
,
��' (
new
��) , 
LoadStateEventArgs
��- ?
(
��? @
e
��@ A
.
��A B
	Parameter
��B K
,
��K L
null
��M Q
)
��Q R
)
��R S
;
��S T
}
�� 
}
�� 
else
�� 
{
�� 
if
�� 
(
�� 
this
�� 
.
�� 
	LoadState
�� "
!=
��# %
null
��& *
)
��* +
{
�� 
this
�� 
.
�� 
	LoadState
�� "
(
��" #
this
��# '
,
��' (
new
��) , 
LoadStateEventArgs
��- ?
(
��? @
e
��@ A
.
��A B
	Parameter
��B K
,
��K L
(
��M N

Dictionary
��N X
<
��X Y
String
��Y _
,
��_ `
Object
��a g
>
��g h
)
��h i

frameState
��i s
[
��s t
this
��t x
.
��x y
_pageKey��y �
]��� �
)��� �
)��� �
;��� �
}
�� 
}
�� 
}
�� 	
public
�� 
void
�� 
OnNavigatedFrom
�� #
(
��# $!
NavigationEventArgs
��$ 7
e
��8 9
)
��9 :
{
�� 	
var
�� 

frameState
�� 
=
�� 
SuspensionManager
�� .
.
��. /"
SessionStateForFrame
��/ C
(
��C D
this
��D H
.
��H I
Frame
��I N
)
��N O
;
��O P
var
�� 
	pageState
�� 
=
�� 
new
�� 

Dictionary
��  *
<
��* +
String
��+ 1
,
��1 2
Object
��3 9
>
��9 :
(
��: ;
)
��; <
;
��< =
if
�� 
(
�� 
this
�� 
.
�� 
	SaveState
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
this
�� 
.
�� 
	SaveState
�� 
(
�� 
this
�� #
,
��# $
new
��% ( 
SaveStateEventArgs
��) ;
(
��; <
	pageState
��< E
)
��E F
)
��F G
;
��G H
}
�� 

frameState
�� 
[
�� 
_pageKey
�� 
]
��  
=
��! "
	pageState
��# ,
;
��, -
}
�� 	
}
�� 
public
�� 

delegate
�� 
void
�� #
LoadStateEventHandler
�� .
(
��. /
object
��/ 5
sender
��6 <
,
��< = 
LoadStateEventArgs
��> P
e
��Q R
)
��R S
;
��S T
public
�� 

delegate
�� 
void
�� #
SaveStateEventHandler
�� .
(
��. /
object
��/ 5
sender
��6 <
,
��< = 
SaveStateEventArgs
��> P
e
��Q R
)
��R S
;
��S T
public
�� 

class
��  
LoadStateEventArgs
�� #
:
��$ %
	EventArgs
��& /
{
�� 
public
�� 
Object
�� !
NavigationParameter
�� )
{
��* +
get
��, /
;
��/ 0
private
��1 8
set
��9 <
;
��< =
}
��> ?
public
�� 

Dictionary
�� 
<
�� 
string
��  
,
��  !
Object
��" (
>
��( )
	PageState
��* 3
{
��4 5
get
��6 9
;
��9 :
private
��; B
set
��C F
;
��F G
}
��H I
public
��  
LoadStateEventArgs
�� !
(
��! "
Object
��" (!
navigationParameter
��) <
,
��< =

Dictionary
��> H
<
��H I
string
��I O
,
��O P
Object
��Q W
>
��W X
	pageState
��Y b
)
��b c
:
�� 
base
�� 
(
�� 
)
�� 
{
�� 	
this
�� 
.
�� !
NavigationParameter
�� $
=
��% &!
navigationParameter
��' :
;
��: ;
this
�� 
.
�� 
	PageState
�� 
=
�� 
	pageState
�� &
;
��& '
}
�� 	
}
�� 
public
�� 

class
��  
SaveStateEventArgs
�� #
:
��$ %
	EventArgs
��& /
{
�� 
public
�� 

Dictionary
�� 
<
�� 
string
��  
,
��  !
Object
��" (
>
��( )
	PageState
��* 3
{
��4 5
get
��6 9
;
��9 :
private
��; B
set
��C F
;
��F G
}
��H I
public
��  
SaveStateEventArgs
�� !
(
��! "

Dictionary
��" ,
<
��, -
string
��- 3
,
��3 4
Object
��5 ;
>
��; <
	pageState
��= F
)
��F G
:
�� 
base
�� 
(
�� 
)
�� 
{
�� 	
this
�� 
.
�� 
	PageState
�� 
=
�� 
	pageState
�� &
;
��& '
}
�� 	
}
�� 
}�� �
PC:\Sources\Other\ModernKeePass\ModernKeePass\Common\NotifyPropertyChangedBase.cs
	namespace 	
ModernKeePass
 
. 
Common 
{ 
public 

class %
NotifyPropertyChangedBase *
:+ ,"
INotifyPropertyChanged- C
{ 
public		 
event		 '
PropertyChangedEventHandler		 0
PropertyChanged		1 @
;		@ A
	protected 
void 
OnPropertyChanged (
(( )
string) /
propertyName0 <
== >
$str? A
)A B
{ 	
PropertyChanged 
? 
. 
Invoke #
(# $
this$ (
,( )
new* -$
PropertyChangedEventArgs. F
(F G
propertyNameG S
)S T
)T U
;U V
} 	
	protected 
bool 
SetProperty "
<" #
T# $
>$ %
(% &
ref& )
T* +
property, 4
,4 5
T6 7
value8 =
,= >
[? @
CallerMemberName@ P
]P Q
stringR X
propertyNameY e
=f g
$strh j
)j k
{ 	
if 
( 
EqualityComparer  
<  !
T! "
>" #
.# $
Default$ +
.+ ,
Equals, 2
(2 3
property3 ;
,; <
value= B
)B C
)C D
{ 
return 
false 
; 
} 
property 
= 
value 
; 
OnPropertyChanged 
( 
propertyName *
)* +
;+ ,
return 
true 
; 
} 	
} 
} �`
KC:\Sources\Other\ModernKeePass\ModernKeePass\Common\ObservableDictionary.cs
	namespace 	
ModernKeePass
 
. 
Common 
{ 
public 

class  
ObservableDictionary %
:& '
IObservableMap( 6
<6 7
string7 =
,= >
object? E
>E F
{ 
private 
class 0
$ObservableDictionaryChangedEventArgs :
:; < 
IMapChangedEventArgs= Q
<Q R
stringR X
>X Y
{ 	
public 0
$ObservableDictionaryChangedEventArgs 7
(7 8
CollectionChange8 H
changeI O
,O P
stringQ W
keyX [
)[ \
{ 
this 
. 
CollectionChange %
=& '
change( .
;. /
this 
. 
Key 
= 
key 
; 
} 
public 
CollectionChange #
CollectionChange$ 4
{5 6
get7 :
;: ;
private< C
setD G
;G H
}I J
public 
string 
Key 
{ 
get  #
;# $
private% ,
set- 0
;0 1
}2 3
} 	
private 

Dictionary 
< 
string !
,! "
object# )
>) *
_dictionary+ 6
=7 8
new9 <

Dictionary= G
<G H
stringH N
,N O
objectP V
>V W
(W X
)X Y
;Y Z
public 
event "
MapChangedEventHandler +
<+ ,
string, 2
,2 3
object4 :
>: ;

MapChanged< F
;F G
private 
void 
InvokeMapChanged %
(% &
CollectionChange& 6
change7 =
,= >
string? E
keyF I
)I J
{ 	
var 
eventHandler 
= 

MapChanged )
;) *
if   
(   
eventHandler   
!=   
null    $
)  $ %
{!! 
eventHandler"" 
("" 
this"" !
,""! "
new""# &0
$ObservableDictionaryChangedEventArgs""' K
(""K L
change""L R
,""R S
key""T W
)""W X
)""X Y
;""Y Z
}## 
}$$ 	
public&& 
void&& 
Add&& 
(&& 
string&& 
key&& "
,&&" #
object&&$ *
value&&+ 0
)&&0 1
{'' 	
this(( 
.(( 
_dictionary(( 
.(( 
Add((  
(((  !
key((! $
,(($ %
value((& +
)((+ ,
;((, -
this)) 
.)) 
InvokeMapChanged)) !
())! "
CollectionChange))" 2
.))2 3
ItemInserted))3 ?
,))? @
key))A D
)))D E
;))E F
}** 	
public,, 
void,, 
Add,, 
(,, 
KeyValuePair,, $
<,,$ %
string,,% +
,,,+ ,
object,,- 3
>,,3 4
item,,5 9
),,9 :
{-- 	
this.. 
... 
Add.. 
(.. 
item.. 
... 
Key.. 
,.. 
item.. #
...# $
Value..$ )
)..) *
;..* +
}// 	
public11 
void11 
AddRange11 
(11 
IEnumerable11 (
<11( )
KeyValuePair11) 5
<115 6
string116 <
,11< =
object11> D
>11D E
>11E F
values11G M
)11M N
{22 	
foreach33 
(33 
var33 
value33 
in33 !
values33" (
)33( )
{44 
Add55 
(55 
value55 
)55 
;55 
}66 
}77 	
public99 
bool99 
Remove99 
(99 
string99 !
key99" %
)99% &
{:: 	
if;; 
(;; 
this;; 
.;; 
_dictionary;;  
.;;  !
Remove;;! '
(;;' (
key;;( +
);;+ ,
);;, -
{<< 
this== 
.== 
InvokeMapChanged== %
(==% &
CollectionChange==& 6
.==6 7
ItemRemoved==7 B
,==B C
key==D G
)==G H
;==H I
return>> 
true>> 
;>> 
}?? 
return@@ 
false@@ 
;@@ 
}AA 	
publicCC 
boolCC 
RemoveCC 
(CC 
KeyValuePairCC '
<CC' (
stringCC( .
,CC. /
objectCC0 6
>CC6 7
itemCC8 <
)CC< =
{DD 	
objectEE 
currentValueEE 
;EE  
ifFF 
(FF 
thisFF 
.FF 
_dictionaryFF  
.FF  !
TryGetValueFF! ,
(FF, -
itemFF- 1
.FF1 2
KeyFF2 5
,FF5 6
outFF7 :
currentValueFF; G
)FFG H
&&FFI K
ObjectGG 
.GG 
EqualsGG 
(GG 
itemGG "
.GG" #
ValueGG# (
,GG( )
currentValueGG* 6
)GG6 7
&&GG8 :
thisGG; ?
.GG? @
_dictionaryGG@ K
.GGK L
RemoveGGL R
(GGR S
itemGGS W
.GGW X
KeyGGX [
)GG[ \
)GG\ ]
{HH 
thisII 
.II 
InvokeMapChangedII %
(II% &
CollectionChangeII& 6
.II6 7
ItemRemovedII7 B
,IIB C
itemIID H
.IIH I
KeyIII L
)IIL M
;IIM N
returnJJ 
trueJJ 
;JJ 
}KK 
returnLL 
falseLL 
;LL 
}MM 	
publicOO 
objectOO 
thisOO 
[OO 
stringOO !
keyOO" %
]OO% &
{PP 	
getQQ 
{RR 
returnSS 
thisSS 
.SS 
_dictionarySS '
[SS' (
keySS( +
]SS+ ,
;SS, -
}TT 
setUU 
{VV 
thisWW 
.WW 
_dictionaryWW  
[WW  !
keyWW! $
]WW$ %
=WW& '
valueWW( -
;WW- .
thisXX 
.XX 
InvokeMapChangedXX %
(XX% &
CollectionChangeXX& 6
.XX6 7
ItemChangedXX7 B
,XXB C
keyXXD G
)XXG H
;XXH I
}YY 
}ZZ 	
public\\ 
void\\ 
Clear\\ 
(\\ 
)\\ 
{]] 	
var^^ 
	priorKeys^^ 
=^^ 
this^^  
.^^  !
_dictionary^^! ,
.^^, -
Keys^^- 1
.^^1 2
ToArray^^2 9
(^^9 :
)^^: ;
;^^; <
this__ 
.__ 
_dictionary__ 
.__ 
Clear__ "
(__" #
)__# $
;__$ %
foreach`` 
(`` 
var`` 
key`` 
in`` 
	priorKeys``  )
)``) *
{aa 
thisbb 
.bb 
InvokeMapChangedbb %
(bb% &
CollectionChangebb& 6
.bb6 7
ItemRemovedbb7 B
,bbB C
keybbD G
)bbG H
;bbH I
}cc 
}dd 	
publicff 
ICollectionff 
<ff 
stringff !
>ff! "
Keysff# '
{gg 	
gethh 
{hh 
returnhh 
thishh 
.hh 
_dictionaryhh )
.hh) *
Keyshh* .
;hh. /
}hh0 1
}ii 	
publickk 
boolkk 
ContainsKeykk 
(kk  
stringkk  &
keykk' *
)kk* +
{ll 	
returnmm 
thismm 
.mm 
_dictionarymm #
.mm# $
ContainsKeymm$ /
(mm/ 0
keymm0 3
)mm3 4
;mm4 5
}nn 	
publicpp 
boolpp 
TryGetValuepp 
(pp  
stringpp  &
keypp' *
,pp* +
outpp, /
objectpp0 6
valuepp7 <
)pp< =
{qq 	
returnrr 
thisrr 
.rr 
_dictionaryrr #
.rr# $
TryGetValuerr$ /
(rr/ 0
keyrr0 3
,rr3 4
outrr5 8
valuerr9 >
)rr> ?
;rr? @
}ss 	
publicuu 
ICollectionuu 
<uu 
objectuu !
>uu! "
Valuesuu# )
{vv 	
getww 
{ww 
returnww 
thisww 
.ww 
_dictionaryww )
.ww) *
Valuesww* 0
;ww0 1
}ww2 3
}xx 	
publiczz 
boolzz 
Containszz 
(zz 
KeyValuePairzz )
<zz) *
stringzz* 0
,zz0 1
objectzz2 8
>zz8 9
itemzz: >
)zz> ?
{{{ 	
return|| 
this|| 
.|| 
_dictionary|| #
.||# $
Contains||$ ,
(||, -
item||- 1
)||1 2
;||2 3
}}} 	
public 
int 
Count 
{
�� 	
get
�� 
{
�� 
return
�� 
this
�� 
.
�� 
_dictionary
�� )
.
��) *
Count
��* /
;
��/ 0
}
��1 2
}
�� 	
public
�� 
bool
�� 

IsReadOnly
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
false
�� 
;
�� 
}
��  !
}
�� 	
public
�� 
IEnumerator
�� 
<
�� 
KeyValuePair
�� '
<
��' (
string
��( .
,
��. /
object
��0 6
>
��6 7
>
��7 8
GetEnumerator
��9 F
(
��F G
)
��G H
{
�� 	
return
�� 
this
�� 
.
�� 
_dictionary
�� #
.
��# $
GetEnumerator
��$ 1
(
��1 2
)
��2 3
;
��3 4
}
�� 	
System
�� 
.
�� 
Collections
�� 
.
�� 
IEnumerator
�� &
System
��' -
.
��- .
Collections
��. 9
.
��9 :
IEnumerable
��: E
.
��E F
GetEnumerator
��F S
(
��S T
)
��T U
{
�� 	
return
�� 
this
�� 
.
�� 
_dictionary
�� #
.
��# $
GetEnumerator
��$ 1
(
��1 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
void
�� 
CopyTo
�� 
(
�� 
KeyValuePair
�� '
<
��' (
string
��( .
,
��. /
object
��0 6
>
��6 7
[
��7 8
]
��8 9
array
��: ?
,
��? @
int
��A D

arrayIndex
��E O
)
��O P
{
�� 	
int
�� 
	arraySize
�� 
=
�� 
array
�� !
.
��! "
Length
��" (
;
��( )
foreach
�� 
(
�� 
var
�� 
pair
�� 
in
��  
this
��! %
.
��% &
_dictionary
��& 1
)
��1 2
{
�� 
if
�� 
(
�� 

arrayIndex
�� 
>=
�� !
	arraySize
��" +
)
��+ ,
break
��- 2
;
��2 3
array
�� 
[
�� 

arrayIndex
��  
++
��  "
]
��" #
=
��$ %
pair
��& *
;
��* +
}
�� 
}
�� 	
}
�� 
}�� �
CC:\Sources\Other\ModernKeePass\ModernKeePass\Common\RelayCommand.cs
	namespace 	
ModernKeePass
 
. 
Common 
{		 
public 

class 
RelayCommand 
: 
ICommand  (
{ 
private 
readonly 
Action 
_execute  (
;( )
private 
readonly 
Func 
< 
bool "
>" #
_canExecute$ /
;/ 0
public 
event 
EventHandler !
CanExecuteChanged" 3
;3 4
public 
RelayCommand 
( 
Action "
execute# *
)* +
:   
this   
(   
execute   
,   
null    
)    !
{!! 	
}"" 	
public)) 
RelayCommand)) 
()) 
Action)) "
execute))# *
,))* +
Func)), 0
<))0 1
bool))1 5
>))5 6

canExecute))7 A
)))A B
{** 	
if++ 
(++ 
execute++ 
==++ 
null++ 
)++  
throw,, 
new,, !
ArgumentNullException,, /
(,,/ 0
$str,,0 9
),,9 :
;,,: ;
_execute-- 
=-- 
execute-- 
;-- 
_canExecute.. 
=.. 

canExecute.. $
;..$ %
}// 	
public88 
bool88 

CanExecute88 
(88 
object88 %
	parameter88& /
)88/ 0
{99 	
return:: 
_canExecute:: 
==:: !
null::" &
?::' (
true::) -
:::. /
_canExecute::0 ;
(::; <
)::< =
;::= >
};; 	
publicCC 
voidCC 
ExecuteCC 
(CC 
objectCC "
	parameterCC# ,
)CC, -
{DD 	
_executeEE 
(EE 
)EE 
;EE 
}FF 	
publicMM 
voidMM "
RaiseCanExecuteChangedMM *
(MM* +
)MM+ ,
{NN 	
varOO 
handlerOO 
=OO 
CanExecuteChangedOO +
;OO+ ,
ifPP 
(PP 
handlerPP 
!=PP 
nullPP 
)PP  
{QQ 
handlerRR 
(RR 
thisRR 
,RR 
	EventArgsRR '
.RR' (
EmptyRR( -
)RR- .
;RR. /
}SS 
}TT 	
}UU 
}VV 
HC:\Sources\Other\ModernKeePass\ModernKeePass\Common\SuspensionManager.cs
	namespace 	
ModernKeePass
 
. 
Common 
{ 
internal 
sealed 
class 
SuspensionManager +
{ 
private 
static 

Dictionary !
<! "
string" (
,( )
object* 0
>0 1
_sessionState2 ?
=@ A
newB E

DictionaryF P
<P Q
stringQ W
,W X
objectY _
>_ `
(` a
)a b
;b c
private 
static 
List 
< 
Type  
>  !
_knownTypes" -
=. /
new0 3
List4 8
<8 9
Type9 =
>= >
(> ?
)? @
;@ A
private 
const 
string  
sessionStateFilename 1
=2 3
$str4 G
;G H
public$$ 
static$$ 

Dictionary$$  
<$$  !
string$$! '
,$$' (
object$$) /
>$$/ 0
SessionState$$1 =
{%% 	
get&& 
{&& 
return&& 
_sessionState&& &
;&&& '
}&&( )
}'' 	
public.. 
static.. 
List.. 
<.. 
Type.. 
>..  

KnownTypes..! +
{// 	
get00 
{00 
return00 
_knownTypes00 $
;00$ %
}00& '
}11 	
public:: 
static:: 
async:: 
Task::  
	SaveAsync::! *
(::* +
)::+ ,
{;; 	
try<< 
{== 
foreach?? 
(?? 
var?? 
weakFrameReference?? /
in??0 2
_registeredFrames??3 D
)??D E
{@@ 
FrameAA 
frameAA 
;AA  
ifBB 
(BB 
weakFrameReferenceBB *
.BB* +
TryGetTargetBB+ 7
(BB7 8
outBB8 ;
frameBB< A
)BBA B
)BBB C
{CC $
SaveFrameNavigationStateDD 0
(DD0 1
frameDD1 6
)DD6 7
;DD7 8
}EE 
}FF 
MemoryStreamJJ 
sessionDataJJ (
=JJ) *
newJJ+ .
MemoryStreamJJ/ ;
(JJ; <
)JJ< =
;JJ= >"
DataContractSerializerKK &

serializerKK' 1
=KK2 3
newKK4 7"
DataContractSerializerKK8 N
(KKN O
typeofKKO U
(KKU V

DictionaryKKV `
<KK` a
stringKKa g
,KKg h
objectKKi o
>KKo p
)KKp q
,KKq r
_knownTypesKKs ~
)KK~ 
;	KK �

serializerLL 
.LL 
WriteObjectLL &
(LL& '
sessionDataLL' 2
,LL2 3
_sessionStateLL4 A
)LLA B
;LLB C
StorageFileOO 
fileOO  
=OO! "
awaitOO# (
ApplicationDataOO) 8
.OO8 9
CurrentOO9 @
.OO@ A
LocalFolderOOA L
.OOL M
CreateFileAsyncOOM \
(OO\ ] 
sessionStateFilenameOO] q
,OOq r$
CreationCollisionOption	OOs �
.
OO� �
ReplaceExisting
OO� �
)
OO� �
;
OO� �
usingPP 
(PP 
StreamPP 

fileStreamPP (
=PP) *
awaitPP+ 0
filePP1 5
.PP5 6#
OpenStreamForWriteAsyncPP6 M
(PPM N
)PPN O
)PPO P
{QQ 
sessionDataRR 
.RR  
SeekRR  $
(RR$ %
$numRR% &
,RR& '

SeekOriginRR( 2
.RR2 3
BeginRR3 8
)RR8 9
;RR9 :
awaitSS 
sessionDataSS %
.SS% &
CopyToAsyncSS& 1
(SS1 2

fileStreamSS2 <
)SS< =
;SS= >
}TT 
}UU 
catchVV 
(VV 
	ExceptionVV 
eVV 
)VV 
{WW 
throwXX 
newXX &
SuspensionManagerExceptionXX 4
(XX4 5
eXX5 6
)XX6 7
;XX7 8
}YY 
}ZZ 	
publicgg 
staticgg 
asyncgg 
Taskgg  
RestoreAsyncgg! -
(gg- .
Stringgg. 4
sessionBaseKeygg5 C
=ggD E
nullggF J
)ggJ K
{hh 	
_sessionStateii 
=ii 
newii 

Dictionaryii  *
<ii* +
Stringii+ 1
,ii1 2
Objectii3 9
>ii9 :
(ii: ;
)ii; <
;ii< =
trykk 
{ll 
StorageFilenn 
filenn  
=nn! "
awaitnn# (
ApplicationDatann) 8
.nn8 9
Currentnn9 @
.nn@ A
LocalFoldernnA L
.nnL M
GetFileAsyncnnM Y
(nnY Z 
sessionStateFilenamennZ n
)nnn o
;nno p
usingoo 
(oo 
IInputStreamoo #
inStreamoo$ ,
=oo- .
awaitoo/ 4
fileoo5 9
.oo9 :#
OpenSequentialReadAsyncoo: Q
(ooQ R
)ooR S
)ooS T
{pp "
DataContractSerializerrr *

serializerrr+ 5
=rr6 7
newrr8 ;"
DataContractSerializerrr< R
(rrR S
typeofrrS Y
(rrY Z

DictionaryrrZ d
<rrd e
stringrre k
,rrk l
objectrrm s
>rrs t
)rrt u
,rru v
_knownTypes	rrw �
)
rr� �
;
rr� �
_sessionStatess !
=ss" #
(ss$ %

Dictionaryss% /
<ss/ 0
stringss0 6
,ss6 7
objectss8 >
>ss> ?
)ss? @

serializerss@ J
.ssJ K

ReadObjectssK U
(ssU V
inStreamssV ^
.ss^ _
AsStreamForReadss_ n
(ssn o
)sso p
)ssp q
;ssq r
}tt 
foreachww 
(ww 
varww 
weakFrameReferenceww /
inww0 2
_registeredFramesww3 D
)wwD E
{xx 
Frameyy 
frameyy 
;yy  
ifzz 
(zz 
weakFrameReferencezz *
.zz* +
TryGetTargetzz+ 7
(zz7 8
outzz8 ;
framezz< A
)zzA B
&&zzC E
(zzF G
stringzzG M
)zzM N
framezzN S
.zzS T
GetValuezzT \
(zz\ ]'
FrameSessionBaseKeyPropertyzz] x
)zzx y
==zzz |
sessionBaseKey	zz} �
)
zz� �
{{{ 
frame|| 
.|| 

ClearValue|| (
(||( )%
FrameSessionStateProperty||) B
)||B C
;||C D'
RestoreFrameNavigationState}} 3
(}}3 4
frame}}4 9
)}}9 :
;}}: ;
}~~ 
} 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
throw
�� 
new
�� (
SuspensionManagerException
�� 4
(
��4 5
e
��5 6
)
��6 7
;
��7 8
}
�� 
}
�� 	
private
�� 
static
��  
DependencyProperty
�� )*
FrameSessionStateKeyProperty
��* F
=
��G H 
DependencyProperty
�� 
.
�� 
RegisterAttached
�� /
(
��/ 0
$str
��0 G
,
��G H
typeof
��I O
(
��O P
String
��P V
)
��V W
,
��W X
typeof
��Y _
(
��_ `
SuspensionManager
��` q
)
��q r
,
��r s
null
��t x
)
��x y
;
��y z
private
�� 
static
��  
DependencyProperty
�� ))
FrameSessionBaseKeyProperty
��* E
=
��F G 
DependencyProperty
�� 
.
�� 
RegisterAttached
�� /
(
��/ 0
$str
��0 L
,
��L M
typeof
��N T
(
��T U
String
��U [
)
��[ \
,
��\ ]
typeof
��^ d
(
��d e
SuspensionManager
��e v
)
��v w
,
��w x
null
��y }
)
��} ~
;
��~ 
private
�� 
static
��  
DependencyProperty
�� )'
FrameSessionStateProperty
��* C
=
��D E 
DependencyProperty
�� 
.
�� 
RegisterAttached
�� /
(
��/ 0
$str
��0 D
,
��D E
typeof
��F L
(
��L M

Dictionary
��M W
<
��W X
String
��X ^
,
��^ _
Object
��` f
>
��f g
)
��g h
,
��h i
typeof
��j p
(
��p q 
SuspensionManager��q �
)��� �
,��� �
null��� �
)��� �
;��� �
private
�� 
static
�� 
List
�� 
<
�� 
WeakReference
�� )
<
��) *
Frame
��* /
>
��/ 0
>
��0 1
_registeredFrames
��2 C
=
��D E
new
��F I
List
��J N
<
��N O
WeakReference
��O \
<
��\ ]
Frame
��] b
>
��b c
>
��c d
(
��d e
)
��e f
;
��f g
public
�� 
static
�� 
void
�� 
RegisterFrame
�� (
(
��( )
Frame
��) .
frame
��/ 4
,
��4 5
String
��6 <
sessionStateKey
��= L
,
��L M
String
��N T
sessionBaseKey
��U c
=
��d e
null
��f j
)
��j k
{
�� 	
if
�� 
(
�� 
frame
�� 
.
�� 
GetValue
�� 
(
�� *
FrameSessionStateKeyProperty
�� ;
)
��; <
!=
��= ?
null
��@ D
)
��D E
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 3
(
��3 4
$str
��4 l
)
��l m
;
��m n
}
�� 
if
�� 
(
�� 
frame
�� 
.
�� 
GetValue
�� 
(
�� '
FrameSessionStateProperty
�� 8
)
��8 9
!=
��: <
null
��= A
)
��A B
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 3
(
��3 4
$str��4 �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
sessionBaseKey
��& 4
)
��4 5
)
��5 6
{
�� 
frame
�� 
.
�� 
SetValue
�� 
(
�� )
FrameSessionBaseKeyProperty
�� :
,
��: ;
sessionBaseKey
��< J
)
��J K
;
��K L
sessionStateKey
�� 
=
��  !
sessionBaseKey
��" 0
+
��1 2
$str
��3 6
+
��7 8
sessionStateKey
��9 H
;
��H I
}
�� 
frame
�� 
.
�� 
SetValue
�� 
(
�� *
FrameSessionStateKeyProperty
�� 7
,
��7 8
sessionStateKey
��9 H
)
��H I
;
��I J
_registeredFrames
�� 
.
�� 
Add
�� !
(
��! "
new
��" %
WeakReference
��& 3
<
��3 4
Frame
��4 9
>
��9 :
(
��: ;
frame
��; @
)
��@ A
)
��A B
;
��B C)
RestoreFrameNavigationState
�� '
(
��' (
frame
��( -
)
��- .
;
��. /
}
�� 	
public
�� 
static
�� 
void
�� 
UnregisterFrame
�� *
(
��* +
Frame
��+ 0
frame
��1 6
)
��6 7
{
�� 	
SessionState
�� 
.
�� 
Remove
�� 
(
��  
(
��  !
String
��! '
)
��' (
frame
��( -
.
��- .
GetValue
��. 6
(
��6 7*
FrameSessionStateKeyProperty
��7 S
)
��S T
)
��T U
;
��U V
_registeredFrames
�� 
.
�� 
	RemoveAll
�� '
(
��' (
(
��( ) 
weakFrameReference
��) ;
)
��; <
=>
��= ?
{
�� 
Frame
�� 
	testFrame
�� 
;
��  
return
�� 
!
��  
weakFrameReference
�� *
.
��* +
TryGetTarget
��+ 7
(
��7 8
out
��8 ;
	testFrame
��< E
)
��E F
||
��G I
	testFrame
��J S
==
��T V
frame
��W \
;
��\ ]
}
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
static
�� 

Dictionary
��  
<
��  !
String
��! '
,
��' (
Object
��) /
>
��/ 0"
SessionStateForFrame
��1 E
(
��E F
Frame
��F K
frame
��L Q
)
��Q R
{
�� 	
var
�� 

frameState
�� 
=
�� 
(
�� 

Dictionary
�� (
<
��( )
String
��) /
,
��/ 0
Object
��1 7
>
��7 8
)
��8 9
frame
��9 >
.
��> ?
GetValue
��? G
(
��G H'
FrameSessionStateProperty
��H a
)
��a b
;
��b c
if
�� 
(
�� 

frameState
�� 
==
�� 
null
�� "
)
��" #
{
�� 
var
�� 
frameSessionKey
�� #
=
��$ %
(
��& '
String
��' -
)
��- .
frame
��. 3
.
��3 4
GetValue
��4 <
(
��< =*
FrameSessionStateKeyProperty
��= Y
)
��Y Z
;
��Z [
if
�� 
(
�� 
frameSessionKey
�� #
!=
��$ &
null
��' +
)
��+ ,
{
�� 
if
�� 
(
�� 
!
�� 
_sessionState
�� &
.
��& '
ContainsKey
��' 2
(
��2 3
frameSessionKey
��3 B
)
��B C
)
��C D
{
�� 
_sessionState
�� %
[
��% &
frameSessionKey
��& 5
]
��5 6
=
��7 8
new
��9 <

Dictionary
��= G
<
��G H
String
��H N
,
��N O
Object
��P V
>
��V W
(
��W X
)
��X Y
;
��Y Z
}
�� 

frameState
�� 
=
��  
(
��! "

Dictionary
��" ,
<
��, -
String
��- 3
,
��3 4
Object
��5 ;
>
��; <
)
��< =
_sessionState
��= J
[
��J K
frameSessionKey
��K Z
]
��Z [
;
��[ \
}
�� 
else
�� 
{
�� 

frameState
�� 
=
��  
new
��! $

Dictionary
��% /
<
��/ 0
String
��0 6
,
��6 7
Object
��8 >
>
��> ?
(
��? @
)
��@ A
;
��A B
}
�� 
frame
�� 
.
�� 
SetValue
�� 
(
�� '
FrameSessionStateProperty
�� 8
,
��8 9

frameState
��: D
)
��D E
;
��E F
}
�� 
return
�� 

frameState
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
void
�� )
RestoreFrameNavigationState
�� 7
(
��7 8
Frame
��8 =
frame
��> C
)
��C D
{
�� 	
var
�� 

frameState
�� 
=
�� "
SessionStateForFrame
�� 1
(
��1 2
frame
��2 7
)
��7 8
;
��8 9
if
�� 
(
�� 

frameState
�� 
.
�� 
ContainsKey
�� &
(
��& '
$str
��' 3
)
��3 4
)
��4 5
{
�� 
frame
�� 
.
��  
SetNavigationState
�� (
(
��( )
(
��) *
String
��* 0
)
��0 1

frameState
��1 ;
[
��; <
$str
��< H
]
��H I
)
��I J
;
��J K
}
�� 
}
�� 	
private
�� 
static
�� 
void
�� &
SaveFrameNavigationState
�� 4
(
��4 5
Frame
��5 :
frame
��; @
)
��@ A
{
�� 	
var
�� 

frameState
�� 
=
�� "
SessionStateForFrame
�� 1
(
��1 2
frame
��2 7
)
��7 8
;
��8 9

frameState
�� 
[
�� 
$str
�� #
]
��# $
=
��% &
frame
��' ,
.
��, - 
GetNavigationState
��- ?
(
��? @
)
��@ A
;
��A B
}
�� 	
}
�� 
public
�� 

class
�� (
SuspensionManagerException
�� +
:
��, -
	Exception
��. 7
{
�� 
public
�� (
SuspensionManagerException
�� )
(
��) *
)
��* +
{
�� 	
}
�� 	
public
�� (
SuspensionManagerException
�� )
(
��) *
	Exception
��* 3
e
��4 5
)
��5 6
:
�� 
base
�� 
(
�� 
$str
�� -
,
��- .
e
��/ 0
)
��0 1
{
�� 	
}
�� 	
}
�� 
}�� �-
GC:\Sources\Other\ModernKeePass\ModernKeePass\Services\LicenseService.cs
	namespace 	
ModernKeePass
 
. 
Services  
{ 
public		 

class		 
LicenseService		 
:		  ! 
SingletonServiceBase		" 6
<		6 7
LicenseService		7 E
>		E F
,		F G
ILicenseService		H W
{

 
public 
enum 
PurchaseResult "
{ 	
	Succeeded 
, 
NothingToFulfill 
, 
PurchasePending 
, 
PurchaseReverted 
, 
ServerError 
, 
NotPurchased 
, 
AlreadyPurchased 
} 	
public 
IReadOnlyDictionary "
<" #
string# )
,) *
ProductListing+ 9
>9 :
Products; C
{D E
getF I
;I J
}K L
private 
readonly 
HashSet  
<  !
Guid! %
>% &#
_consumedTransactionIds' >
=? @
newA D
HashSetE L
<L M
GuidM Q
>Q R
(R S
)S T
;T U
public 
LicenseService 
( 
) 
{ 	
var 
listing 
= 

CurrentApp $
.$ %'
LoadListingInformationAsync% @
(@ A
)A B
.B C

GetAwaiterC M
(M N
)N O
.O P
	GetResultP Y
(Y Z
)Z [
;[ \
Products 
= 
listing 
. 
ProductListings .
;. /
} 	
public!! 
async!! 
Task!! 
<!! 
int!! 
>!! 
Purchase!! '
(!!' (
string!!( .
addOn!!/ 4
)!!4 5
{"" 	
var## 
purchaseResults## 
=##  !
await##" '

CurrentApp##( 2
.##2 3'
RequestProductPurchaseAsync##3 N
(##N O
addOn##O T
)##T U
;##U V
switch$$ 
($$ 
purchaseResults$$ #
.$$# $
Status$$$ *
)$$* +
{%% 
case&& !
ProductPurchaseStatus&& *
.&&* +
	Succeeded&&+ 4
:&&4 5
GrantFeatureLocally'' '
(''' (
purchaseResults''( 7
.''7 8
TransactionId''8 E
)''E F
;''F G
return(( 
((( 
int(( 
)((  
await((! &"
ReportFulfillmentAsync((' =
(((= >
purchaseResults((> M
.((M N
TransactionId((N [
,(([ \
addOn((] b
)((b c
;((c d
case)) !
ProductPurchaseStatus)) *
.))* +
NotFulfilled))+ 7
:))7 8
if,, 
(,, 
!,, 
IsLocallyFulfilled,, +
(,,+ ,
purchaseResults,,, ;
.,,; <
TransactionId,,< I
),,I J
),,J K
{-- 
GrantFeatureLocally.. +
(..+ ,
purchaseResults.., ;
...; <
TransactionId..< I
)..I J
;..J K
}// 
return00 
(00 
int00 
)00  
await00! &"
ReportFulfillmentAsync00' =
(00= >
purchaseResults00> M
.00M N
TransactionId00N [
,00[ \
addOn00] b
)00b c
;00c d
case11 !
ProductPurchaseStatus11 *
.11* +
NotPurchased11+ 7
:117 8
return22 
(22 
int22 
)22  
PurchaseResult22! /
.22/ 0
NotPurchased220 <
;22< =
case33 !
ProductPurchaseStatus33 *
.33* +
AlreadyPurchased33+ ;
:33; <
return44 
(44 
int44 
)44  
PurchaseResult44! /
.44/ 0
AlreadyPurchased440 @
;44@ A
default55 
:55 
throw66 
new66 '
ArgumentOutOfRangeException66 9
(669 :
)66: ;
;66; <
}77 
}88 	
private:: 
async:: 
Task:: 
<:: 
PurchaseResult:: )
>::) *"
ReportFulfillmentAsync::+ A
(::A B
Guid::B F
transactionId::G T
,::T U
string::V \
productName::] h
)::h i
{;; 	
var<< 
result<< 
=<< 
await<< 

CurrentApp<< )
.<<) *,
 ReportConsumableFulfillmentAsync<<* J
(<<J K
productName<<K V
,<<V W
transactionId<<X e
)<<e f
;<<f g
return== 
(== 
PurchaseResult== "
)==" #
result==$ *
;==* +
}>> 	
private@@ 
void@@ 
GrantFeatureLocally@@ (
(@@( )
Guid@@) -
transactionId@@. ;
)@@; <
{AA 	#
_consumedTransactionIdsBB #
.BB# $
AddBB$ '
(BB' (
transactionIdBB( 5
)BB5 6
;BB6 7
}CC 	
privateEE 
boolEE 
IsLocallyFulfilledEE '
(EE' (
GuidEE( ,
transactionIdEE- :
)EE: ;
{FF 	
returnGG #
_consumedTransactionIdsGG *
.GG* +
ContainsGG+ 3
(GG3 4
transactionIdGG4 A
)GGA B
;GGB C
}HH 	
}II 
}JJ �
FC:\Sources\Other\ModernKeePass\ModernKeePass\Services\RecentService.cs
	namespace		 	
ModernKeePass		
 
.		 
Services		  
{

 
public 

class 
RecentService 
:   
SingletonServiceBase! 5
<5 6
RecentService6 C
>C D
,D E
IRecentServiceF T
{ 
private 
readonly +
StorageItemMostRecentlyUsedList 8
_mru9 =
=> ?)
StorageApplicationPermissions@ ]
.] ^ 
MostRecentlyUsedList^ r
;r s
public 
int 

EntryCount 
=>  
_mru! %
.% &
Entries& -
.- .
Count. 3
;3 4
public  
ObservableCollection #
<# $
IRecentItem$ /
>/ 0
GetAllFiles1 <
(< =
bool= A
removeIfNonExistantB U
=V W
trueX \
)\ ]
{ 	
var 
result 
= 
new  
ObservableCollection 1
<1 2
IRecentItem2 =
>= >
(> ?
)? @
;@ A
foreach 
( 
var 
entry 
in !
_mru" &
.& '
Entries' .
). /
{ 
try 
{ 
var 
file 
= 
_mru #
.# $
GetFileAsync$ 0
(0 1
entry1 6
.6 7
Token7 <
,< =
AccessCacheOptions> P
.P Q$
SuppressAccessTimeUpdateQ i
)i j
.j k

GetAwaiterk u
(u v
)v w
.w x
	GetResult	x �
(
� �
)
� �
;
� �
result 
. 
Add 
( 
new "
RecentItemVm# /
(/ 0
entry0 5
.5 6
Token6 ;
,; <
entry= B
.B C
MetadataC K
,K L
fileM Q
)Q R
)R S
;S T
} 
catch 
( 
	Exception  
)  !
{ 
if 
( 
removeIfNonExistant +
)+ ,
_mru- 1
.1 2
Remove2 8
(8 9
entry9 >
.> ?
Token? D
)D E
;E F
} 
} 
return   
result   
;   
}!! 	
public## 
void## 
Add## 
(## 
IStorageItem## $
file##% )
,##) *
string##+ 1
metadata##2 :
)##: ;
{$$ 	
_mru%% 
.%% 
Add%% 
(%% 
file%% 
,%% 
metadata%% #
)%%# $
;%%$ %
}&& 	
public(( 
void(( 
ClearAll(( 
((( 
)(( 
{)) 	
_mru** 
.** 
Clear** 
(** 
)** 
;** 
}++ 	
public-- 
async-- 
Task-- 
<-- 
IStorageItem-- &
>--& '
GetFileAsync--( 4
(--4 5
string--5 ;
token--< A
)--A B
{.. 	
return// 
await// 
_mru// 
.// 
GetFileAsync// *
(//* +
token//+ 0
)//0 1
;//1 2
}00 	
}11 
}22 �	
IC:\Sources\Other\ModernKeePass\ModernKeePass\Services\ResourcesService.cs
	namespace 	
ModernKeePass
 
. 
Services  
{ 
public 

class 
ResourcesService !
:! "
IResourceService# 3
{ 
private 
const 
string 
ResourceFileName -
=. /
$str0 <
;< =
private		 
readonly		 
ResourceLoader		 '
_resourceLoader		( 7
=		8 9
ResourceLoader		: H
.		H I
GetForCurrentView		I Z
(		Z [
)		[ \
;		\ ]
public 
string 
GetResourceValue &
(& '
string' -
key. 1
)1 2
{ 	
var 
resource 
= 
_resourceLoader *
.* +
	GetString+ 4
(4 5
$"5 7
/7 8
{8 9
ResourceFileName9 I
}I J
/J K
{K L
keyL O
}O P
"P Q
)Q R
;R S
return 
resource 
; 
} 	
} 
} �
HC:\Sources\Other\ModernKeePass\ModernKeePass\Services\SettingsService.cs
	namespace 	
ModernKeePass
 
. 
Services  
{ 
public 

class 
SettingsService  
:! " 
SingletonServiceBase# 7
<7 8
SettingsService8 G
>G H
,H I
ISettingsServiceJ Z
{		 
private

 
readonly

 
IPropertySet

 %
_values

& -
=

. /
ApplicationData

0 ?
.

? @
Current

@ G
.

G H
LocalSettings

H U
.

U V
Values

V \
;

\ ]
public 
T 

GetSetting 
< 
T 
> 
( 
string %
property& .
,. /
T0 1
defaultValue2 >
=? @
defaultA H
(H I
TI J
)J K
)K L
{ 	
try 
{ 
return 
( 
T 
) 
Convert !
.! "

ChangeType" ,
(, -
_values- 4
[4 5
property5 =
]= >
,> ?
typeof@ F
(F G
TG H
)H I
)I J
;J K
} 
catch 
(  
InvalidCastException '
)' (
{ 
return 
defaultValue #
;# $
} 
} 	
public 
void 

PutSetting 
< 
T  
>  !
(! "
string" (
property) 1
,1 2
T3 4
value5 :
): ;
{ 	
if 
( 
_values 
. 
ContainsKey #
(# $
property$ ,
), -
)- .
_values 
[ 
property  
]  !
=" #
value$ )
;) *
else 
_values 
. 
Add 
( 
property %
,% &
value' ,
), -
;- .
} 	
} 
} �.
NC:\Sources\Other\ModernKeePass\ModernKeePass\Common\ToastNotificationHelper.cs
	namespace 	
ModernKeePass
 
. 
Common 
{		 
public

 

static

 
class

 #
ToastNotificationHelper

 /
{ 
public 
static 
void 
ShowMovedToast )
() *
	IPwEntity* 3
entity4 :
,: ;
string< B
actionC I
,I J
stringK Q
textR V
)V W
{ 	
var 

entityType 
= 
entity #
is$ &
GroupVm' .
?/ 0
$str1 8
:9 :
$str; B
;B C
var 
notificationXml 
=  !$
ToastNotificationManager" :
.: ;
GetTemplateContent; M
(M N
ToastTemplateTypeN _
._ `
ToastText02` k
)k l
;l m
var 
toastElements 
= 
notificationXml  /
./ 0 
GetElementsByTagName0 D
(D E
$strE K
)K L
;L M
toastElements 
[ 
$num 
] 
. 
AppendChild (
(( )
notificationXml) 8
.8 9
CreateTextNode9 G
(G H
$"H J
{J K
actionK Q
}Q R
{S T

entityTypeT ^
}^ _
{` a
entitya g
.g h
Nameh l
}l m
"m n
)n o
)o p
;p q
toastElements 
[ 
$num 
] 
. 
AppendChild (
(( )
notificationXml) 8
.8 9
CreateTextNode9 G
(G H
textH L
)L M
)M N
;N O
var 
	toastNode 
= 
notificationXml +
.+ ,
SelectSingleNode, <
(< =
$str= E
)E F
;F G
var 
launch 
= 
new 

JsonObject '
{ 
{ 
$str 
, 
	JsonValue (
.( )
CreateStringValue) :
(: ;

entityType; E
)E F
}F G
,G H
{ 
$str 
, 
	JsonValue &
.& '
CreateStringValue' 8
(8 9
entity9 ?
.? @
Id@ B
)B C
}C D
} 
; 
( 
( 

XmlElement 
) 
	toastNode "
)" #
?# $
.$ %
SetAttribute% 1
(1 2
$str2 :
,: ;
launch< B
.B C
	StringifyC L
(L M
)M N
)N O
;O P
var 
toast 
= 
new 
ToastNotification -
(- .
notificationXml. =
)= >
{ 
ExpirationTime 
=  
DateTime! )
.) *
Now* -
.- .

AddSeconds. 8
(8 9
$num9 :
): ;
} 
; $
ToastNotificationManager   $
.  $ %
CreateToastNotifier  % 8
(  8 9
)  9 :
.  : ;
Show  ; ?
(  ? @
toast  @ E
)  E F
;  F G
}!! 	
public## 
static## 
void## 
ShowGenericToast## +
(##+ ,
string##, 2
title##3 8
,##8 9
string##: @
text##A E
)##E F
{$$ 	
var%% 
notificationXml%% 
=%%  !$
ToastNotificationManager%%" :
.%%: ;
GetTemplateContent%%; M
(%%M N
ToastTemplateType%%N _
.%%_ `
ToastText02%%` k
)%%k l
;%%l m
var&& 
toastElements&& 
=&& 
notificationXml&&  /
.&&/ 0 
GetElementsByTagName&&0 D
(&&D E
$str&&E K
)&&K L
;&&L M
toastElements'' 
['' 
$num'' 
]'' 
.'' 
AppendChild'' (
(''( )
notificationXml'') 8
.''8 9
CreateTextNode''9 G
(''G H
title''H M
)''M N
)''N O
;''O P
toastElements(( 
[(( 
$num(( 
](( 
.(( 
AppendChild(( (
(((( )
notificationXml(() 8
.((8 9
CreateTextNode((9 G
(((G H
text((H L
)((L M
)((M N
;((N O
var** 
toast** 
=** 
new** 
ToastNotification** -
(**- .
notificationXml**. =
)**= >
{++ 
ExpirationTime,, 
=,,  
DateTime,,! )
.,,) *
Now,,* -
.,,- .

AddSeconds,,. 8
(,,8 9
$num,,9 :
),,: ;
}-- 
;-- $
ToastNotificationManager.. $
...$ %
CreateToastNotifier..% 8
(..8 9
)..9 :
...: ;
Show..; ?
(..? @
toast..@ E
)..E F
;..F G
}// 	
public11 
static11 
void11 
ShowErrorToast11 )
(11) *
	Exception11* 3
	exception114 =
)11= >
{22 	
ShowGenericToast33 
(33 
	exception33 &
.33& '
Source33' -
,33- .
	exception33/ 8
.338 9
Message339 @
)33@ A
;33A B
}44 	
}55 
}66 �
`C:\Sources\Other\ModernKeePass\ModernKeePass\Converters\DiscreteIntToSolidColorBrushConverter.cs
	namespace 	
ModernKeePass
 
. 

Converters "
{ 
public 

class 1
%DiscreteIntToSolidColorBrushConverter 6
:7 8
IValueConverter9 H
{		 
public

 
object

 
Convert

 
(

 
object

 $
value

% *
,

* +
Type

, 0

targetType

1 ;
,

; <
object

= C
	parameter

D M
,

M N
string

O U
language

V ^
)

^ _
{ 	
var 
status 
= 
System 
.  
Convert  '
.' (
ToInt32( /
(/ 0
value0 5
)5 6
;6 7
switch 
( 
status 
) 
{ 
case 
$num 
: 
return 
new "
SolidColorBrush# 2
(2 3
Colors3 9
.9 :
Red: =
)= >
;> ?
case 
$num 
: 
return 
new "
SolidColorBrush# 2
(2 3
Colors3 9
.9 :
Yellow: @
)@ A
;A B
case 
$num 
: 
return 
new "
SolidColorBrush# 2
(2 3
Colors3 9
.9 :
Green: ?
)? @
;@ A
default 
: 
return 
new  #
SolidColorBrush$ 3
(3 4
Colors4 :
.: ;
Black; @
)@ A
;A B
} 
} 	
public 
object 
ConvertBack !
(! "
object" (
value) .
,. /
Type0 4

targetType5 ?
,? @
objectA G
	parameterH Q
,Q R
stringS Y
languageZ b
)b c
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
} 
} �
[C:\Sources\Other\ModernKeePass\ModernKeePass\Converters\EmptyStringToVisibilityConverter.cs
	namespace 	
ModernKeePass
 
. 

Converters "
{ 
class 	,
 EmptyStringToVisibilityConverter
 *
:* +
IValueConverter, ;
{ 
public		 
object		 
Convert		 
(		 
object		 $
value		% *
,		* +
Type		, 0

targetType		1 ;
,		; <
object		= C
	parameter		D M
,		M N
string		O U
language		V ^
)		^ _
{

 	
var 
text 
= 
value 
is 
string  &
?' (
value) .
.. /
ToString/ 7
(7 8
)8 9
:: ;
string< B
.B C
EmptyC H
;H I
return 
string 
. 
IsNullOrEmpty '
(' (
text( ,
), -
?. /

Visibility0 :
.: ;
	Collapsed; D
:E F

VisibilityG Q
.Q R
VisibleR Y
;Y Z
} 	
public 
object 
ConvertBack !
(! "
object" (
value) .
,. /
Type0 4

targetType5 ?
,? @
objectA G
	parameterH Q
,Q R
stringS Y
languageZ b
)b c
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
} 
} �	
QC:\Sources\Other\ModernKeePass\ModernKeePass\Converters\NullToBooleanConverter.cs
	namespace 	
ModernKeePass
 
. 

Converters "
{ 
public 

class "
NullToBooleanConverter '
:( )
IValueConverter* 9
{ 
public 
object 
Convert 
( 
object $
value% *
,* +
Type, 0

targetType1 ;
,; <
object= C
	parameterD M
,M N
stringO U
languageV ^
)^ _
{		 	
return

 
value

 
!=

 
null

  
;

  !
} 	
public 
object 
ConvertBack !
(! "
object" (
value) .
,. /
Type0 4

targetType5 ?
,? @
objectA G
	parameterH Q
,Q R
stringS Y
languageZ b
)b c
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
} 
} �
HC:\Sources\Other\ModernKeePass\ModernKeePass\Exceptions\SaveException.cs
	namespace 	
ModernKeePass
 
. 

Exceptions "
{ 
public 

class 
SaveException 
:  
	Exception! *
{ 
public 
new 
	Exception 
InnerException +
{, -
get. 1
;1 2
}3 4
public		 
SaveException		 
(		 
	Exception		 &
	exception		' 0
)		0 1
{

 	
InnerException 
= 
	exception &
;& '
} 	
} 
} �
SC:\Sources\Other\ModernKeePass\ModernKeePass\Extensions\DispatcherTaskExtensions.cs
	namespace 	
ModernKeePass
 
. 

Extensions "
{ 
public 

static 
class $
DispatcherTaskExtensions 0
{ 
public		 
static		 
async		 
Task		  
<		  !
T		! "
>		" #
RunTaskAsync		$ 0
<		0 1
T		1 2
>		2 3
(		3 4
this		4 8
CoreDispatcher		9 G

dispatcher		H R
,		R S
Func

 
<

 
Task

 
<

 
T

 
>

 
>

 
func

 
,

 "
CoreDispatcherPriority

  6
priority

7 ?
=

@ A"
CoreDispatcherPriority

B X
.

X Y
Normal

Y _
)

_ `
{ 	
var  
taskCompletionSource $
=% &
new' * 
TaskCompletionSource+ ?
<? @
T@ A
>A B
(B C
)C D
;D E
await 

dispatcher 
. 
RunAsync %
(% &
priority& .
,. /
async0 5
(6 7
)7 8
=>9 ;
{ 
try 
{  
taskCompletionSource (
.( )
	SetResult) 2
(2 3
await3 8
func9 =
(= >
)> ?
)? @
;@ A
} 
catch 
( 
	Exception  
ex! #
)# $
{  
taskCompletionSource (
.( )
SetException) 5
(5 6
ex6 8
)8 9
;9 :
} 
} 
) 
; 
return 
await  
taskCompletionSource -
.- .
Task. 2
;2 3
} 	
public 
static 
async 
Task  
RunTaskAsync! -
(- .
this. 2
CoreDispatcher3 A

dispatcherB L
,L M
Func 
< 
Task 
> 
func 
, "
CoreDispatcherPriority 3
priority4 <
== >"
CoreDispatcherPriority? U
.U V
NormalV \
)\ ]
=>^ `
await 
RunTaskAsync 
( 

dispatcher )
,) *
async+ 0
(1 2
)2 3
=>4 6
{7 8
await9 >
func? C
(C D
)D E
;E F
returnG M
falseN S
;S T
}U V
,V W
priorityX `
)` a
;a b
} 
}   �
KC:\Sources\Other\ModernKeePass\ModernKeePass\Interfaces\IDatabaseService.cs
	namespace 	
ModernKeePass
 
. 

Interfaces "
{		 
public

 

	interface

 
IDatabaseService

 %
{ 
string 
Name 
{ 
get 
; 
} 
bool 
RecycleBinEnabled 
{  
get! $
;$ %
set& )
;) *
}+ ,
GroupVm 
	RootGroup 
{ 
get 
;  
set! $
;$ %
}& '
GroupVm 

RecycleBin 
{ 
get  
;  !
set" %
;% &
}' (
StorageFile 
DatabaseFile  
{! "
get# &
;& '
set( +
;+ ,
}- .
CompositeKey 
CompositeKey !
{" #
get$ '
;' (
set) ,
;, -
}. /
PwUuid 

DataCipher 
{ 
get 
;  
set! $
;$ %
}& '"
PwCompressionAlgorithm  
CompressionAlgorithm 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
KdfParameters 
KeyDerivation #
{$ %
get& )
;) *
set+ .
;. /
}0 1
bool 
IsOpen 
{ 
get 
; 
} 
bool 

IsFileOpen 
{ 
get 
; 
}  
bool 
IsClosed 
{ 
get 
; 
} 
bool 

HasChanged 
{ 
get 
; 
set "
;" #
}$ %
Task 
Open 
( 
CompositeKey 
key "
," #
bool$ (
	createNew) 2
=3 4
false5 :
): ;
;; <
Task 
ReOpen 
( 
) 
; 
void 
Save 
( 
) 
; 
void 
Save 
( 
StorageFile 
file "
)" #
;# $
void 
CreateRecycleBin 
( 
string $
title% *
)* +
;+ ,
void   
AddDeletedItem   
(   
PwUuid   "
id  # %
)  % &
;  & '
Task!! 
Close!! 
(!! 
bool!! 
releaseFile!! #
=!!$ %
true!!& *
)!!* +
;!!+ ,
}"" 
}## �
OC:\Sources\Other\ModernKeePass\ModernKeePass\Interfaces\IHasSelectableObject.cs
	namespace 	
ModernKeePass
 
. 

Interfaces "
{ 
public 

	interface  
IHasSelectableObject )
{ 
ISelectableModel 
SelectedItem %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} �
KC:\Sources\Other\ModernKeePass\ModernKeePass\Interfaces\ISelectableModel.cs
	namespace 	
ModernKeePass
 
. 

Interfaces "
{ 
public 

	interface 
ISelectableModel %
{ 
bool 

IsSelected 
{ 
get 
; 
set "
;" #
}$ %
} 
} �I
SC:\Sources\Other\ModernKeePass\ModernKeePass\Views\BasePages\LayoutAwarePageBase.cs
	namespace		 	
ModernKeePass		
 
.		 
Views		 
.		 
	BasePages		 '
{

 
public 

class 
LayoutAwarePageBase $
:$ %
Page& *
{ 
public 
NavigationHelper 
NavigationHelper  0
{1 2
get3 6
;6 7
}8 9
public 
virtual 
ListView 
ListView  (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
virtual  
CollectionViewSource +
ListViewSource, :
{; <
get= @
;@ A
setB E
;E F
}G H
public 
virtual  
IHasSelectableObject +
Model, 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
LayoutAwarePageBase "
(" #
)# $
{ 	
NavigationHelper 
= 
new "
NavigationHelper# 3
(3 4
this4 8
)8 9
;9 :
NavigationHelper 
. 
	LoadState &
+=' )&
navigationHelper_LoadState* D
;D E
NavigationHelper 
. 
	SaveState &
+=' )&
navigationHelper_SaveState* D
;D E
NavigationHelper   
.   
GoBackCommand   *
=  + ,
new  - 0
RelayCommand  1 =
(  = >
(  > ?
)  ? @
=>  A C
GoBack  D J
(  J K
)  K L
,  L M
(  N O
)  O P
=>  Q S
	CanGoBack  T ]
(  ] ^
)  ^ _
)  _ `
;  ` a
Window$$ 
.$$ 
Current$$ 
.$$ 
SizeChanged$$ &
+=$$' )
Window_SizeChanged$$* <
;$$< =!
InvalidateVisualState%% !
(%%! "
)%%" #
;%%# $
}&& 	
	protected(( 
void(( %
ListView_SelectionChanged(( 0
(((0 1
object((1 7
sender((8 >
,((> ?%
SelectionChangedEventArgs((@ Y
e((Z [
)(([ \
{)) 	
if// 
(// 
!// &
UsingLogicalPageNavigation// +
(//+ ,
)//, -
)//- .
return/// 5
;//5 6
NavigationHelper00 
.00 
GoBackCommand00 *
.00* +"
RaiseCanExecuteChanged00+ A
(00A B
)00B C
;00C D!
InvalidateVisualState11 !
(11! "
)11" #
;11# $
}22 	
	protected?? 
void?? &
navigationHelper_LoadState?? 1
(??1 2
object??2 8
sender??9 ?
,??? @
LoadStateEventArgs??A S
e??T U
)??U V
{@@ 	
ifDD 
(DD 
eDD 
.DD 
	PageStateDD 
==DD 
nullDD #
)DD# $
{EE 
ifHH 
(HH 
!HH &
UsingLogicalPageNavigationHH /
(HH/ 0
)HH0 1
)HH1 2
{II 
ListViewSourceJJ "
.JJ" #
ViewJJ# '
?JJ' (
.JJ( )
MoveCurrentToFirstJJ) ;
(JJ; <
)JJ< =
;JJ= >
}KK 
}LL 
elseMM 
{NN 
ifPP 
(PP 
ePP 
.PP 
	PageStatePP 
.PP  
ContainsKeyPP  +
(PP+ ,
$strPP, :
)PP: ;
)PP; <
{QQ 
ListViewSourceRR "
.RR" #
ViewRR# '
?RR' (
.RR( )
MoveCurrentToRR) 6
(RR6 7
eRR7 8
.RR8 9
	PageStateRR9 B
[RRB C
$strRRC Q
]RRQ R
)RRR S
;RRS T
}SS 
}TT 
}UU 	
	protected__ 
void__ &
navigationHelper_SaveState__ 1
(__1 2
object__2 8
sender__9 ?
,__? @
SaveStateEventArgs__A S
e__T U
)__U V
{`` 	
ifaa 
(aa 
ListViewSourceaa 
.aa 
Viewaa #
!=aa$ &
nullaa' +
)aa+ ,
{bb 
ecc 
.cc 
	PageStatecc 
[cc 
$strcc *
]cc* +
=cc, -
Modelcc. 3
?cc3 4
.cc4 5
SelectedItemcc5 A
;ccA B
}dd 
}ee 	
	protectedpp 
constpp 
intpp -
!MinimumWidthForSupportingTwoPanespp =
=pp> ?
$numpp@ C
;ppC D
	protectedww 
boolww &
UsingLogicalPageNavigationww 1
(ww1 2
)ww2 3
{xx 	
returnyy 
Windowyy 
.yy 
Currentyy !
.yy! "
Boundsyy" (
.yy( )
Widthyy) .
<yy/ 0-
!MinimumWidthForSupportingTwoPanesyy1 R
;yyR S
}zz 	
	protected
�� 
void
��  
Window_SizeChanged
�� )
(
��) *
object
��* 0
sender
��1 7
,
��7 8
Windows
��9 @
.
��@ A
UI
��A C
.
��C D
Core
��D H
.
��H I(
WindowSizeChangedEventArgs
��I c
e
��d e
)
��e f
{
�� 	#
InvalidateVisualState
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
	protected
�� 
bool
�� 
	CanGoBack
��  
(
��  !
)
��! "
{
�� 	
if
�� 
(
�� (
UsingLogicalPageNavigation
�� *
(
��* +
)
��+ ,
&&
��- /
ListView
��0 8
.
��8 9
SelectedItem
��9 E
!=
��F H
null
��I M
)
��M N
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
return
�� 
NavigationHelper
�� #
.
��# $
	CanGoBack
��$ -
(
��- .
)
��. /
;
��/ 0
}
�� 	
	protected
�� 
void
�� 
GoBack
�� 
(
�� 
)
�� 
{
�� 	
if
�� 
(
�� (
UsingLogicalPageNavigation
�� *
(
��* +
)
��+ ,
&&
��- /
ListView
��0 8
.
��8 9
SelectedItem
��9 E
!=
��F H
null
��I M
)
��M N
{
�� 
ListView
�� 
.
�� 
SelectedItem
�� %
=
��& '
null
��( ,
;
��, -
}
�� 
else
�� 
{
�� 
NavigationHelper
��  
.
��  !
GoBack
��! '
(
��' (
)
��( )
;
��) *
}
�� 
}
�� 	
	protected
�� 
void
�� #
InvalidateVisualState
�� ,
(
��, -
)
��- .
{
�� 	
var
�� 
visualState
�� 
=
�� "
DetermineVisualState
�� 2
(
��2 3
)
��3 4
;
��4 5 
VisualStateManager
�� 
.
�� 
	GoToState
�� (
(
��( )
this
��) -
,
��- .
visualState
��/ :
,
��: ;
false
��< A
)
��A B
;
��B C
NavigationHelper
�� 
.
�� 
GoBackCommand
�� *
.
��* +$
RaiseCanExecuteChanged
��+ A
(
��A B
)
��B C
;
��C D
}
�� 	
	protected
�� 
string
�� "
DetermineVisualState
�� -
(
��- .
)
��. /
{
�� 	
if
�� 
(
�� 
!
�� (
UsingLogicalPageNavigation
�� +
(
��+ ,
)
��, -
)
��- .
return
�� 
$str
�� $
;
��$ %
var
�� 
logicalPageBack
�� 
=
��  !(
UsingLogicalPageNavigation
��" <
(
��< =
)
��= >
&&
��? A
ListView
��B J
?
��J K
.
��K L
SelectedItem
��L X
!=
��Y [
null
��\ `
;
��` a
return
�� 
logicalPageBack
�� "
?
��# $
$str
��% 8
:
��9 :
$str
��; G
;
��G H
}
�� 	
	protected
�� 
override
�� 
void
�� 
OnNavigatedTo
��  -
(
��- .!
NavigationEventArgs
��. A
e
��B C
)
��C D
{
�� 	
NavigationHelper
�� 
.
�� 
OnNavigatedTo
�� *
(
��* +
e
��+ ,
)
��, -
;
��- .
}
�� 	
	protected
�� 
override
�� 
void
�� 
OnNavigatedFrom
��  /
(
��/ 0!
NavigationEventArgs
��0 C
e
��D E
)
��E F
{
�� 	
NavigationHelper
�� 
.
�� 
OnNavigatedFrom
�� ,
(
��, -
e
��- .
)
��. /
;
��/ 0
}
�� 	
}
�� 
}�� �
bC:\Sources\Other\ModernKeePass\ModernKeePass\Views\SettingsPageFrames\SettingsDatabasePage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class  
SettingsDatabasePage  4
{		 
public

  
SettingsDatabasePage

 #
(

# $
)

$ %
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
} 
} �
eC:\Sources\Other\ModernKeePass\ModernKeePass\Views\SettingsPageFrames\SettingsNewDatabasePage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class #
SettingsNewDatabasePage  7
{		 
public

 #
SettingsNewDatabasePage

 &
(

& '
)

' (
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
} 
} �
^C:\Sources\Other\ModernKeePass\ModernKeePass\Views\SettingsPageFrames\SettingsSavePage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class 
SettingsSavePage  0
{		 
public

 
SettingsSavePage

 
(

  
)

  !
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
} 
} �
bC:\Sources\Other\ModernKeePass\ModernKeePass\Views\SettingsPageFrames\SettingsSecurityPage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class  
SettingsSecurityPage  4
{ 
public  
SettingsSecurityPage #
(# $
)$ %
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
private 
void 7
+CompositeKeyUserControl_OnValidationChecked @
(@ A
objectA G
senderH N
,N O
PasswordEventArgsP a
eb c
)c d
{ 	#
ToastNotificationHelper #
.# $
ShowGenericToast$ 4
(4 5
$str5 D
,D E
$strF f
)f g
;g h
} 	
} 
} �
aC:\Sources\Other\ModernKeePass\ModernKeePass\Views\SettingsPageFrames\SettingsWelcomePage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class 
SettingsWelcomePage  3
{		 
public

 
SettingsWelcomePage

 "
(

" #
)

# $
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
} 
} �
_C:\Sources\Other\ModernKeePass\ModernKeePass\TemplateSelectors\FirstItemDataTemplateSelector.cs
	namespace 	
ModernKeePass
 
. 
TemplateSelectors )
{ 
public 

class )
FirstItemDataTemplateSelector .
:. / 
DataTemplateSelector0 D
{ 
public 
DataTemplate 
	FirstItem %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public		 
DataTemplate		 
	OtherItem		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
	protected 
override 
DataTemplate '
SelectTemplateCore( :
(: ;
object; A
itemB F
,F G
DependencyObjectH X
	containerY b
)b c
{ 	
var 
itemsControl 
= 
ItemsControl +
.+ ,)
ItemsControlFromItemContainer, I
(I J
	containerJ S
)S T
;T U
var 
returnTemplate 
=  
itemsControl! -
?- .
.. /
IndexFromContainer/ A
(A B
	containerB K
)K L
==M O
$numP Q
?R S
	FirstItemT ]
:^ _
	OtherItem` i
;i j
return 
returnTemplate !
;! "
} 	
} 
} �
LC:\Sources\Other\ModernKeePass\ModernKeePass\Controls\ListViewWithDisable.cs
	namespace 	
ModernKeePass
 
. 
Controls  
{ 
public 

class 
ListViewWithDisable $
:$ %
ListView& .
{ 
	protected		 
override		 
void		 +
PrepareContainerForItemOverride		  ?
(		? @
DependencyObject		@ P
element		Q X
,		X Y
object		Z `
item		a e
)		e f
{

 	
base 
. +
PrepareContainerForItemOverride 0
(0 1
element1 8
,8 9
item: >
)> ?
;? @
var 
	container 
= 
element #
as$ &
ListViewItem' 3
;3 4
var 

binaryItem 
= 
item !
as" $

IIsEnabled% /
;/ 0
if 
( 
	container 
== 
null !
||" $

binaryItem% /
==0 2
null3 7
)7 8
return9 ?
;? @
	container 
. 
	IsEnabled 
=  !

binaryItem" ,
., -
	IsEnabled- 6
;6 7
	container 
. 
IsHitTestVisible &
=' (

binaryItem) 3
.3 4
	IsEnabled4 =
;= >
} 	
} 
} �
]C:\Sources\Other\ModernKeePass\ModernKeePass\Views\UserControls\BreadCrumbUserControl.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
. 
UserControls *
{ 
public		 

sealed		 
partial		 
class		 !
BreadCrumbUserControl		  5
{

 
public !
BreadCrumbUserControl $
($ %
)% &
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
public 
IEnumerable 
< 
	IPwEntity $
>$ %
ItemsSource& 1
{ 	
get 
{ 
return 
( 
IEnumerable %
<% &
	IPwEntity& /
>/ 0
)0 1
GetValue1 9
(9 :
ItemsSourceProperty: M
)M N
;N O
}P Q
set 
{ 
SetValue 
( 
ItemsSourceProperty .
,. /
value0 5
)5 6
;6 7
}8 9
} 	
public 
static 
readonly 
DependencyProperty 1
ItemsSourceProperty2 E
=F G
DependencyProperty 
. 
Register '
(' (
$str 
, 
typeof 
( 
IEnumerable "
<" #
	IPwEntity# ,
>, -
)- .
,. /
typeof 
( !
BreadCrumbUserControl ,
), -
,- .
new 
PropertyMetadata $
($ %
new% (
Stack) .
<. /
	IPwEntity/ 8
>8 9
(9 :
): ;
,; <
(= >
o> ?
,? @
argsA E
)E F
=>G I
{J K
}L M
)M N
)N O
;O P
} 
} �T
_C:\Sources\Other\ModernKeePass\ModernKeePass\Views\UserControls\CompositeKeyUserControl.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
. 
UserControls *
{ 
public 

sealed 
partial 
class #
CompositeKeyUserControl  7
{ 
public 
CompositeKeyVm 
Model #
=>$ &
Grid' +
.+ ,
DataContext, 7
as8 :
CompositeKeyVm; I
;I J
public 
bool 
	CreateNew 
{ 	
get 
{ 
return 
( 
bool 
) 
GetValue '
(' (
CreateNewProperty( 9
)9 :
;: ;
}< =
set 
{ 
SetValue 
( 
CreateNewProperty ,
,, -
value. 3
)3 4
;4 5
}6 7
} 	
public 
static 
readonly 
DependencyProperty 1
CreateNewProperty2 C
=D E
DependencyProperty 
. 
Register '
(' (
$str 
, 
typeof 
( 
bool 
) 
, 
typeof 
( #
CompositeKeyUserControl .
). /
,/ 0
new 
PropertyMetadata $
($ %
false% *
,* +
(, -
o- .
,. /
args0 4
)4 5
=>6 8
{9 :
}; <
)< =
)= >
;> ?
public   
bool   
	UpdateKey   
{!! 	
get"" 
{"" 
return"" 
("" 
bool"" 
)"" 
GetValue"" '
(""' (
UpdateKeyProperty""( 9
)""9 :
;"": ;
}""< =
set## 
{## 
SetValue## 
(## 
UpdateKeyProperty## ,
,##, -
value##. 3
)##3 4
;##4 5
}##6 7
}$$ 	
public%% 
static%% 
readonly%% 
DependencyProperty%% 1
UpdateKeyProperty%%2 C
=%%D E
DependencyProperty&& 
.&& 
Register&& '
(&&' (
$str'' 
,'' 
typeof(( 
((( 
bool(( 
)(( 
,(( 
typeof)) 
()) #
CompositeKeyUserControl)) .
))). /
,))/ 0
new** 
PropertyMetadata** $
(**$ %
false**% *
,*** +
(**, -
o**- .
,**. /
args**0 4
)**4 5
=>**6 8
{**9 :
}**; <
)**< =
)**= >
;**> ?
public,, 
string,, 
ButtonLabel,, !
{-- 	
get.. 
{.. 
return.. 
(.. 
string..  
)..  !
GetValue..! )
(..) *
ButtonLabelProperty..* =
)..= >
;..> ?
}..@ A
set// 
{// 
SetValue// 
(// 
ButtonLabelProperty// .
,//. /
value//0 5
)//5 6
;//6 7
}//8 9
}00 	
public11 
static11 
readonly11 
DependencyProperty11 1
ButtonLabelProperty112 E
=11F G
DependencyProperty22 
.22 
Register22 '
(22' (
$str33 
,33 
typeof44 
(44 
string44 
)44 
,44 
typeof55 
(55 #
CompositeKeyUserControl55 .
)55. /
,55/ 0
new66 
PropertyMetadata66 $
(66$ %
$str66% )
,66) *
(66+ ,
o66, -
,66- .
args66/ 3
)663 4
=>665 7
{668 9
}66: ;
)66; <
)66< =
;66= >
public99 
bool99 #
ShowComplexityIndicator99 +
=>99, .
	CreateNew99/ 8
||999 ;
	UpdateKey99< E
;99E F
public;; #
CompositeKeyUserControl;; &
(;;& '
);;' (
{<< 	
InitializeComponent== 
(==  
)==  !
;==! "
}>> 	
public@@ 
event@@ (
PasswordCheckingEventHandler@@ 1
ValidationChecking@@2 D
;@@D E
publicAA 
delegateAA 
voidAA (
PasswordCheckingEventHandlerAA 9
(AA9 :
objectAA: @
senderAAA G
,AAG H
	EventArgsAAI R
eAAS T
)AAT U
;AAU V
publicBB 
eventBB '
PasswordCheckedEventHandlerBB 0
ValidationCheckedBB1 B
;BBB C
publicCC 
delegateCC 
voidCC '
PasswordCheckedEventHandlerCC 8
(CC8 9
objectCC9 ?
senderCC@ F
,CCF G
PasswordEventArgsCCH Y
eCCZ [
)CC[ \
;CC\ ]
privateEE 
asyncEE 
voidEE 
OpenButton_OnClickEE -
(EE- .
objectEE. 4
senderEE5 ;
,EE; <
RoutedEventArgsEE= L
eEEM N
)EEN O
{FF 	
ValidationCheckingGG 
?GG 
.GG  
InvokeGG  &
(GG& '
thisGG' +
,GG+ ,
newGG- 0
	EventArgsGG1 :
(GG: ;
)GG; <
)GG< =
;GG= >
ifII 
(II 
	UpdateKeyII 
)II 
{JJ 
ModelKK 
.KK 
	UpdateKeyKK 
(KK  
)KK  !
;KK! "
ValidationCheckedLL !
?LL! "
.LL" #
InvokeLL# )
(LL) *
thisLL* .
,LL. /
newLL0 3
PasswordEventArgsLL4 E
(LLE F
ModelLLF K
.LLK L
	RootGroupLLL U
)LLU V
)LLV W
;LLW X
}MM 
elseNN 
{OO 
varPP 
resourcePP 
=PP 
newPP "
ResourcesServicePP# 3
(PP3 4
)PP4 5
;PP5 6
varQQ 
oldLabelQQ 
=QQ 
ButtonLabelQQ *
;QQ* +
ButtonLabelRR 
=RR 
resourceRR &
.RR& '
GetResourceValueRR' 7
(RR7 8
$strRR8 M
)RRM N
;RRN O
ifSS 
(SS 
awaitSS 

DispatcherSS $
.SS$ %
RunTaskAsyncSS% 1
(SS1 2
asyncSS2 7
(SS8 9
)SS9 :
=>SS; =
awaitSS> C
ModelSSD I
.SSI J
OpenDatabaseSSJ V
(SSV W
	CreateNewSSW `
)SS` a
)SSa b
)SSb c
{TT 
ValidationCheckedUU %
?UU% &
.UU& '
InvokeUU' -
(UU- .
thisUU. 2
,UU2 3
newUU4 7
PasswordEventArgsUU8 I
(UUI J
ModelUUJ O
.UUO P
	RootGroupUUP Y
)UUY Z
)UUZ [
;UU[ \
}VV 
ButtonLabelWW 
=WW 
oldLabelWW &
;WW& '
}XX 
}YY 	
private[[ 
void[[ 
PasswordBox_KeyDown[[ (
([[( )
object[[) /
sender[[0 6
,[[6 7
KeyRoutedEventArgs[[8 J
e[[K L
)[[L M
{\\ 	
if]] 
(]] 
e]] 
.]] 
Key]] 
==]] 

VirtualKey]] #
.]]# $
Enter]]$ )
&&]]* ,
Model]]- 2
.]]2 3
IsValid]]3 :
)]]: ;
{^^ 
OpenButton_OnClick__ "
(__" #
sender__# )
,__) *
e__+ ,
)__, -
;__- .
eaa 
.aa 
Handledaa 
=aa 
trueaa  
;aa  !
}bb 
}cc 	
privateee 
asyncee 
voidee 
KeyFileButton_Clickee .
(ee. /
objectee/ 5
senderee6 <
,ee< =
RoutedEventArgsee> M
eeeN O
)eeO P
{ff 	
vargg 
pickergg 
=gg 
newhh 
FileOpenPickerhh "
{ii 
ViewModejj 
=jj 
PickerViewModejj -
.jj- .
Listjj. 2
,jj2 3"
SuggestedStartLocationkk *
=kk+ ,
PickerLocationIdkk- =
.kk= >
DocumentsLibrarykk> N
}ll 
;ll 
pickermm 
.mm 
FileTypeFiltermm !
.mm! "
Addmm" %
(mm% &
$strmm& ,
)mm, -
;mm- .
varpp 
filepp 
=pp 
awaitpp 
pickerpp #
.pp# $
PickSingleFileAsyncpp$ 7
(pp7 8
)pp8 9
;pp9 :
ifqq 
(qq 
fileqq 
==qq 
nullqq 
)qq 
returnqq $
;qq$ %
Modelrr 
.rr 
KeyFilerr 
=rr 
filerr  
;rr  !
}ss 	
privateuu 
asyncuu 
voiduu %
CreateKeyFileButton_Clickuu 4
(uu4 5
objectuu5 ;
senderuu< B
,uuB C
RoutedEventArgsuuD S
euuT U
)uuU V
{vv 	
varww 

savePickerww 
=ww 
newww  
FileSavePickerww! /
{xx "
SuggestedStartLocationyy &
=yy' (
PickerLocationIdyy) 9
.yy9 :
DocumentsLibraryyy: J
,yyJ K
SuggestedFileNamezz !
=zz" #
$strzz$ )
}{{ 
;{{ 

savePicker|| 
.|| 
FileTypeChoices|| &
.||& '
Add||' *
(||* +
$str||+ 5
,||5 6
new||7 :
List||; ?
<||? @
string||@ F
>||F G
{||H I
$str||J P
}||Q R
)||R S
;||S T
var~~ 
file~~ 
=~~ 
await~~ 

savePicker~~ '
.~~' (
PickSaveFileAsync~~( 9
(~~9 :
)~~: ;
;~~; <
if 
( 
file 
== 
null 
) 
return $
;$ %
Model
�� 
.
�� 
CreateKeyFile
�� 
(
��  
file
��  $
)
��$ %
;
��% &
}
�� 	
}
�� 
}�� �1
JC:\Sources\Other\ModernKeePass\ModernKeePass\Controls\TextBoxWithButton.cs
	namespace 	
ModernKeePass
 
. 
Controls  
{ 
public 

class 
TextBoxWithButton "
:# $
TextBox% ,
{		 
public

 
string

 
ButtonSymbol

 "
{ 	
get 
{ 
return 
( 
string  
)  !
GetValue! )
() * 
ButtonSymbolProperty* >
)> ?
;? @
}A B
set 
{ 
SetValue 
(  
ButtonSymbolProperty /
,/ 0
value1 6
)6 7
;7 8
}9 :
} 	
public 
static 
readonly 
DependencyProperty 1 
ButtonSymbolProperty2 F
=G H
DependencyProperty 
. 
Register '
(' (
$str 
, 
typeof 
( 
string 
) 
, 
typeof 
( 
TextBoxWithButton (
)( )
,) *
new 
PropertyMetadata $
($ %
$str% /
,/ 0
(1 2
o2 3
,3 4
args5 9
)9 :
=>; =
{> ?
}@ A
)A B
)B C
;C D
public 
event 
EventHandler !
<! "
RoutedEventArgs" 1
>1 2
ButtonClick3 >
;> ?
public 
string 
ButtonTooltip #
{ 	
get 
{ 
return 
( 
string  
)  !
GetValue! )
() *!
ButtonTooltipProperty* ?
)? @
;@ A
}B C
set 
{ 
SetValue 
( !
ButtonTooltipProperty 0
,0 1
value2 7
)7 8
;8 9
}: ;
} 	
public 
static 
readonly 
DependencyProperty 1!
ButtonTooltipProperty2 G
=H I
DependencyProperty 
. 
Register '
(' (
$str 
,  
typeof 
( 
string 
) 
, 
typeof   
(   
TextBoxWithButton   (
)  ( )
,  ) *
new!! 
PropertyMetadata!! $
(!!$ %
string!!% +
.!!+ ,
Empty!!, 1
,!!1 2
(!!3 4
o!!4 5
,!!5 6
args!!7 ;
)!!; <
=>!!= ?
{!!@ A
}!!B C
)!!C D
)!!D E
;!!E F
public## 
bool## 
IsButtonEnabled## #
{$$ 	
get%% 
{%% 
return%% 
(%% 
bool%% 
)%% 
GetValue%% '
(%%' (#
IsButtonEnabledProperty%%( ?
)%%? @
;%%@ A
}%%B C
set&& 
{&& 
SetValue&& 
(&& #
IsButtonEnabledProperty&& 2
,&&2 3
value&&4 9
)&&9 :
;&&: ;
}&&< =
}'' 	
public(( 
static(( 
readonly(( 
DependencyProperty(( 1#
IsButtonEnabledProperty((2 I
=((J K
DependencyProperty)) 
.)) 
Register)) '
())' (
$str** !
,**! "
typeof++ 
(++ 
bool++ 
)++ 
,++ 
typeof,, 
(,, 
TextBoxWithButton,, (
),,( )
,,,) *
new-- 
PropertyMetadata-- $
(--$ %
true--% )
,--) *
(--+ ,
o--, -
,--- .
args--/ 3
)--3 4
=>--5 7
{--8 9
}--: ;
)--; <
)--< =
;--= >
public// 

FlyoutBase// 
ButtonFlyout// &
{00 	
get11 
{11 
return11 
(11 

FlyoutBase11 $
)11$ %
GetValue11% -
(11- . 
ButtonFlyoutProperty11. B
)11B C
;11C D
}11E F
set22 
{22 
SetValue22 
(22  
ButtonFlyoutProperty22 /
,22/ 0
value221 6
)226 7
;227 8
}229 :
}33 	
public44 
static44 
readonly44 
DependencyProperty44 1 
ButtonFlyoutProperty442 F
=44G H
DependencyProperty55 
.55 
Register55 '
(55' (
$str66 
,66 
typeof77 
(77 

FlyoutBase77 !
)77! "
,77" #
typeof88 
(88 
TextBoxWithButton88 (
)88( )
,88) *
new99 
PropertyMetadata99 $
(99$ %
null99% )
,99) *
(99+ ,
o99, -
,99- .
args99/ 3
)993 4
=>995 7
{998 9
}99: ;
)99; <
)99< =
;99= >
	protected;; 
override;; 
void;; 
OnApplyTemplate;;  /
(;;/ 0
);;0 1
{<< 	
base== 
.== 
OnApplyTemplate==  
(==  !
)==! "
;==" #
var>> 
actionButton>> 
=>> 
GetTemplateChild>> /
(>>/ 0
$str>>0 >
)>>> ?
as>>@ B
Button>>C I
;>>I J
if?? 
(?? 
actionButton?? 
!=?? 
null??  $
)??$ %
{@@ 
actionButtonAA 
.AA 
ClickAA "
+=AA# %
(AA& '
senderAA' -
,AA- .
eAA/ 0
)AA0 1
=>AA2 4
ButtonClickAA5 @
?AA@ A
.AAA B
InvokeAAB H
(AAH I
senderAAI O
,AAO P
eAAQ R
)AAR S
;AAS T
}BB 
}CC 	
}DD 
}EE �
WC:\Sources\Other\ModernKeePass\ModernKeePass\Converters\BooleanToVisibilityConverter.cs
	namespace 	
ModernKeePass
 
. 

Converters "
{ 
public 

class (
BooleanToVisibilityConverter -
:. /
IValueConverter0 ?
{ 
public		 
object		 
Convert		 
(		 
object		 $
value		% *
,		* +
Type		, 0

targetType		1 ;
,		; <
object		= C
	parameter		D M
,		M N
string		O U
language		V ^
)		^ _
{

 	
var 
boolean 
= 
value 
is  "
bool# '
?( )
(* +
bool+ /
)/ 0
value1 6
:7 8
false9 >
;> ?
return 
boolean 
? 

Visibility '
.' (
Visible( /
:0 1

Visibility2 <
.< =
	Collapsed= F
;F G
} 	
public 
object 
ConvertBack !
(! "
object" (
value) .
,. /
Type0 4

targetType5 ?
,? @
objectA G
	parameterH Q
,Q R
stringS Y
languageZ b
)b c
{ 	
var 

visibility 
= 
value "
is# %

Visibility& 0
?1 2
(3 4

Visibility4 >
)> ?
value@ E
:F G

VisibilityH R
.R S
VisibleS Z
;Z [
switch 
( 

visibility 
) 
{ 
case 

Visibility 
.  
Visible  '
:' (
return) /
true0 4
;4 5
case 

Visibility 
.  
	Collapsed  )
:) *
return+ 1
false2 7
;7 8
default 
: 
throw 
new '
ArgumentOutOfRangeException 9
(9 :
): ;
;; <
} 
} 	
} 
} �
PC:\Sources\Other\ModernKeePass\ModernKeePass\Converters\ColorToBrushConverter.cs
	namespace 	
ModernKeePass
 
. 

Converters "
{ 
public 

class !
ColorToBrushConverter &
:' (
IValueConverter) 8
{		 
public

 
object

 
Convert

 
(

 
object

 $
value

% *
,

* +
Type

, 0

targetType

1 ;
,

; <
object

= C
	parameter

D M
,

M N
string

O U
language

V ^
)

^ _
{ 	
var 
color 
= 
value 
is  
Color! &
?' (
() *
Color* /
?/ 0
)0 1
value2 7
:8 9
Color: ?
.? @
Empty@ E
;E F
if 
( 
color 
== 
Color 
. 
Empty $
&&% '
	parameter( 1
is2 4
SolidColorBrush5 D
)D E
returnF L
(M N
SolidColorBrushN ]
)] ^
	parameter_ h
;h i
return 
new 
SolidColorBrush &
(& '
Windows' .
.. /
UI/ 1
.1 2
Color2 7
.7 8
FromArgb8 @
(@ A
color 
. 
Value 
. 
A 
, 
color 
. 
Value 
. 
R 
, 
color 
. 
Value 
. 
G 
, 
color 
. 
Value 
. 
B 
) 
) 
;  
} 	
public 
object 
ConvertBack !
(! "
object" (
value) .
,. /
Type0 4

targetType5 ?
,? @
objectA G
	parameterH Q
,Q R
stringS Y
languageZ b
)b c
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
} 
} �
[C:\Sources\Other\ModernKeePass\ModernKeePass\Converters\DoubleToSolidColorBrushConverter.cs
	namespace 	
ModernKeePass
 
. 

Converters "
{ 
public 

class ,
 DoubleToSolidColorBrushConverter 1
:2 3
IValueConverter4 C
{		 
public

 
object

 
Convert

 
(

 
object

 $
value

% *
,

* +
Type

, 0

targetType

1 ;
,

; <
object

= C
	parameter

D M
,

M N
string

O U
language

V ^
)

^ _
{ 	
try 
{ 
var 
currentValue  
=! "
(# $
double$ *
)* +
value, 1
;1 2
var 
maxValue 
= 
double %
.% &
Parse& +
(+ ,
	parameter, 5
as6 8
string9 ?
)? @
;@ A
var 
green 
= 
System "
." #
Convert# *
.* +
ToByte+ 1
(1 2
currentValue2 >
/? @
maxValueA I
*J K
byteL P
.P Q
MaxValueQ Y
)Y Z
;Z [
var 
red 
= 
( 
byte 
)  
(! "
byte" &
.& '
MaxValue' /
-0 1
green2 7
)7 8
;8 9
return 
new 
SolidColorBrush *
(* +
Color+ 0
.0 1
FromArgb1 9
(9 :
$num: =
,= >
red? B
,B C
greenD I
,I J
$numK L
)L M
)M N
;N O
} 
catch 
( 
OverflowException $
)$ %
{ 
return 
new 
SolidColorBrush *
(* +
Color+ 0
.0 1
FromArgb1 9
(9 :
$num: =
,= >
$num? @
,@ A
byteB F
.F G
MaxValueG O
,O P
$numQ R
)R S
)S T
;T U
} 
} 	
public 
object 
ConvertBack !
(! "
object" (
value) .
,. /
Type0 4

targetType5 ?
,? @
objectA G
	parameterH Q
,Q R
stringS Y
languageZ b
)b c
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
} 
} �
^C:\Sources\Other\ModernKeePass\ModernKeePass\Converters\InverseBooleanToVisibilityConverter.cs
	namespace 	
ModernKeePass
 
. 

Converters "
{ 
public 

class /
#InverseBooleanToVisibilityConverter 4
:5 6
IValueConverter7 F
{ 
public		 
object		 
Convert		 
(		 
object		 $
value		% *
,		* +
Type		, 0

targetType		1 ;
,		; <
object		= C
	parameter		D M
,		M N
string		O U
language		V ^
)		^ _
{

 	
var 
boolean 
= 
value 
is  "
bool# '
?( )
(* +
bool+ /
)/ 0
value0 5
:6 7
false8 =
;= >
return 
boolean 
? 

Visibility '
.' (
	Collapsed( 1
:2 3

Visibility4 >
.> ?
Visible? F
;F G
} 	
public 
object 
ConvertBack !
(! "
object" (
value) .
,. /
Type0 4

targetType5 ?
,? @
objectA G
	parameterH Q
,Q R
stringS Y
languageZ b
)b c
{ 	
var 

visibility 
= 
value "
is# %

Visibility& 0
?1 2
(3 4

Visibility4 >
)> ?
value? D
:E F

VisibilityG Q
.Q R
VisibleR Y
;Y Z
switch 
( 

visibility 
) 
{ 
case 

Visibility 
.  
Visible  '
:' (
return) /
false0 5
;5 6
case 

Visibility 
.  
	Collapsed  )
:) *
return+ 1
true2 6
;6 7
default 
: 
throw 
new '
ArgumentOutOfRangeException 9
(9 :
): ;
;; <
} 
} 	
} 
} �
QC:\Sources\Other\ModernKeePass\ModernKeePass\Converters\PluralizationConverter.cs
	namespace 	
ModernKeePass
 
. 

Converters "
{ 
public 

class "
PluralizationConverter '
:( )
IValueConverter* 9
{ 
public 
object 
Convert 
( 
object $
value% *
,* +
Type, 0

targetType1 ;
,; <
object= C
	parameterD M
,M N
stringO U
languageV ^
)^ _
{		 	
var

 %
pluralizationOptionString

 )
=

* +
	parameter

, 5
as

6 8
string

9 ?
;

? @
var  
pluralizationOptions $
=% &%
pluralizationOptionString' @
?@ A
.A B
SplitB G
(G H
newH K
[K L
]L M
{N O
$strP S
}T U
,U V
StringSplitOptionsW i
.i j
RemoveEmptyEntriesj |
)| }
;} ~
if 
(  
pluralizationOptions $
==% '
null( ,
||- / 
pluralizationOptions0 D
.D E
LengthE K
!=L N
$numO P
)P Q
returnR X
stringY _
._ `
Empty` e
;e f
var 
count 
= 
value 
is  
int! $
?% &
(' (
int( +
)+ ,
value- 2
:3 4
$num5 6
;6 7
var 
text 
= 
count 
== 
$num  !
?" # 
pluralizationOptions$ 8
[8 9
$num9 :
]: ;
:< = 
pluralizationOptions> R
[R S
$numS T
]T U
;U V
return 
$" 
{ 
count 
} 
{ 
text "
}" #
"# $
;$ %
} 	
public 
object 
ConvertBack !
(! "
object" (
value) .
,. /
Type0 4

targetType5 ?
,? @
objectA G
	parameterH Q
,Q R
stringS Y
languageZ b
)b c
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
} 
} �
ZC:\Sources\Other\ModernKeePass\ModernKeePass\Converters\ProgressBarLegalValuesConverter.cs
	namespace 	
ModernKeePass
 
. 

Converters "
{ 
public 

class +
ProgressBarLegalValuesConverter 0
:1 2
IValueConverter3 B
{ 
public 
object 
Convert 
( 
object $
value% *
,* +
Type, 0

targetType1 ;
,; <
object= C
	parameterD M
,M N
stringO U
languageV ^
)^ _
{		 	
var

 #
legalValuesOptionString

 '
=

( )
	parameter

* 3
as

4 6
string

7 =
;

= >
var 
legalValuesOptions "
=# $#
legalValuesOptionString% <
?< =
.= >
Split> C
(C D
newD G
[G H
]H I
{J K
$strL O
}P Q
,Q R
StringSplitOptionsS e
.e f
RemoveEmptyEntriesf x
)x y
;y z
if 
( 
legalValuesOptions "
==# %
null& *
||+ -
legalValuesOptions. @
.@ A
LengthA G
!=H J
$numK L
)L M
returnN T
$numU V
;V W
var 
minValue 
= 
double !
.! "
Parse" '
(' (
legalValuesOptions( :
[: ;
$num; <
]< =
)= >
;> ?
var 
maxValue 
= 
double !
.! "
Parse" '
(' (
legalValuesOptions( :
[: ;
$num; <
]< =
)= >
;> ?
var 
count 
= 
value 
is  
double! '
?( )
(* +
double+ 1
)1 2
value2 7
:8 9
$num: ;
;; <
if 
( 
count 
> 
maxValue  
)  !
return" (
maxValue) 1
;1 2
if 
( 
count 
< 
minValue  
)  !
return" (
minValue) 1
;1 2
return 
count 
; 
} 	
public 
object 
ConvertBack !
(! "
object" (
value) .
,. /
Type0 4

targetType5 ?
,? @
objectA G
	parameterH Q
,Q R
stringS Y
languageZ b
)b c
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
} 
} �
OC:\Sources\Other\ModernKeePass\ModernKeePass\Converters\TextToWidthConverter.cs
	namespace 	
ModernKeePass
 
. 

Converters "
{ 
public 

class  
TextToWidthConverter %
:& '
IValueConverter( 7
{ 
public 
object 
Convert 
( 
object $
value% *
,* +
Type, 0

targetType1 ;
,; <
object= C
	parameterD M
,M N
stringO U
languageV ^
)^ _
{		 	
var

 
fontSize

 
=

 
double

 !
.

! "
Parse

" '
(

' (
	parameter

( 1
as

2 4
string

5 ;
)

; <
;

< =
var 
text 
= 
value 
as 
string  &
;& '
return 
text 
? 
. 
Length 
*  !
fontSize" *
??+ -
$num. /
;/ 0
} 	
public 
object 
ConvertBack !
(! "
object" (
value) .
,. /
Type0 4

targetType5 ?
,? @
objectA G
	parameterH Q
,Q R
stringS Y
languageZ b
)b c
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
} 
} �
HC:\Sources\Other\ModernKeePass\ModernKeePass\Events\PasswordEventArgs.cs
	namespace 	
ModernKeePass
 
. 
Events 
{ 
public 

class 
PasswordEventArgs "
:" #
	EventArgs$ -
{ 
public 
GroupVm 
	RootGroup  
{! "
get# &
;& '
set( +
;+ ,
}- .
public

 
PasswordEventArgs

  
(

  !
GroupVm

! (
groupVm

) 0
)

0 1
{ 	
	RootGroup 
= 
groupVm 
;  
} 	
} 
} �
EC:\Sources\Other\ModernKeePass\ModernKeePass\Interfaces\IIsEnabled.cs
	namespace 	
ModernKeePass
 
. 

Interfaces "
{ 
public 

	interface 

IIsEnabled 
{ 
bool 
	IsEnabled 
{ 
get 
; 
} 
} 
} �
DC:\Sources\Other\ModernKeePass\ModernKeePass\Interfaces\IPwEntity.cs
	namespace 	
ModernKeePass
 
. 

Interfaces "
{ 
public 

	interface 
	IPwEntity 
{ 
GroupVm 
ParentGroup 
{ 
get !
;! "
}# $
GroupVm		 
PreviousGroup		 
{		 
get		  #
;		# $
}		% &
int

 
IconId

 
{

 
get

 
;

 
}

 
string 
Id 
{ 
get 
; 
} 
string 
Name 
{ 
get 
; 
set 
; 
}  !
IEnumerable 
< 
	IPwEntity 
> 

BreadCrumb )
{* +
get, /
;/ 0
}1 2
bool 

IsEditMode 
{ 
get 
; 
}  
bool 
IsRecycleOnDelete 
{  
get! $
;$ %
}& '
void 
Move 
( 
GroupVm 
destination %
)% &
;& '
void 
CommitDelete 
( 
) 
; 
void 

UndoDelete 
( 
) 
; 
void!! 
Save!! 
(!! 
)!! 
;!! 
void%% 
MarkForDelete%% 
(%% 
string%% !
recycleBinTitle%%" 1
)%%1 2
;%%2 3
}&& 
}'' �
CC:\Sources\Other\ModernKeePass\ModernKeePass\Views\MainPage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class 
MainPage  (
{ 
public 
new 
MainVm 
Model 
=>  "
(# $
MainVm$ *
)* +
DataContext+ 6
;6 7
public 
MainPage 
( 
) 
{ 	
InitializeComponent 
(  
)  !
;! "
ListView 
= 
MenuListView #
;# $
ListViewSource 
= 
MenuItemsSource ,
;, -
} 	
private 
new 
void %
ListView_SelectionChanged 2
(2 3
object3 9
sender: @
,@ A%
SelectionChangedEventArgsB [
e\ ]
)] ^
{ 	
base 
. %
ListView_SelectionChanged *
(* +
sender+ 1
,1 2
e3 4
)4 5
;5 6
var 
selectedItem 
= 
Model $
.$ %
SelectedItem% 1
as2 4
MainMenuItemVm5 C
;C D
if 
( 
selectedItem 
== 
null  $
)$ %
	MenuFrame& /
./ 0
Navigate0 8
(8 9
typeof9 ?
(? @
WelcomePage@ K
)K L
)L M
;M N
else 
selectedItem 
. 
Destination )
.) *
Navigate* 2
(2 3
selectedItem3 ?
.? @
PageType@ H
,H I
selectedItemJ V
.V W
	ParameterW `
)` a
;a b
} 	
	protected 
override 
void 
OnNavigatedTo  -
(- .
NavigationEventArgs. A
eB C
)C D
{   	
base!! 
.!! 
OnNavigatedTo!! 
(!! 
e!!  
)!!  !
;!!! "
DataContext"" 
="" 
new"" 
MainVm"" $
(""$ %
Frame""% *
,""* +
	MenuFrame"", 5
)""5 6
;""6 7
}## 	
}$$ 
}%% �
SC:\Sources\Other\ModernKeePass\ModernKeePass\Views\MainPageFrames\AboutPage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class 
	AboutPage  )
{		 
public

 
	AboutPage

 
(

 
)

 
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
} 
} �
YC:\Sources\Other\ModernKeePass\ModernKeePass\Views\MainPageFrames\NewDatabasePage.xaml.cs
	namespace		 	
ModernKeePass		
 
.		 
Views		 
{

 
public 

sealed 
partial 
class 
NewDatabasePage  /
{ 
public 
NewVm 
Model 
=> 
( 
NewVm $
)$ %
DataContext% 0
;0 1
public 
NewDatabasePage 
( 
)  
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
private 
async 
void 
ButtonBase_OnClick -
(- .
object. 4
sender5 ;
,; <
RoutedEventArgs= L
eM N
)N O
{ 	
var 

savePicker 
= 
new  
FileSavePicker! /
{ "
SuggestedStartLocation &
=' (
PickerLocationId) 9
.9 :
DocumentsLibrary: J
,J K
SuggestedFileName !
=" #
$str$ 2
} 
; 

savePicker 
. 
FileTypeChoices &
.& '
Add' *
(* +
$str+ A
,A B
newC F
ListG K
<K L
stringL R
>R S
{T U
$strV ]
}^ _
)_ `
;` a
var   
file   
=   
await   

savePicker   '
.  ' (
PickSaveFileAsync  ( 9
(  9 :
)  : ;
;  ; <
if!! 
(!! 
file!! 
==!! 
null!! 
)!! 
return!! $
;!!$ %
Model"" 
."" 
OpenFile"" 
("" 
file"" 
)""  
;""  !
}## 	
}$$ 
}%% �
GC:\Sources\Other\ModernKeePass\ModernKeePass\Views\SettingsPage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class 
SettingsPage  ,
{ 
public 
new 

SettingsVm 
Model #
=>$ &
(' (

SettingsVm( 2
)2 3
DataContext3 >
;> ?
public 
SettingsPage 
( 
) 
{ 	
InitializeComponent 
(  
)  !
;! "
ListView 
= 
MenuListView #
;# $
ListViewSource 
= 
MenuItemsSource ,
;, -
} 	
private 
new 
void %
ListView_SelectionChanged 2
(2 3
object3 9
sender: @
,@ A%
SelectionChangedEventArgsB [
e\ ]
)] ^
{ 	
base 
. %
ListView_SelectionChanged *
(* +
sender+ 1
,1 2
e3 4
)4 5
;5 6
var 
selectedItem 
= 
Model $
.$ %
SelectedItem% 1
as2 4
ListMenuItemVm5 C
;C D
	MenuFrame 
? 
. 
Navigate 
(  
selectedItem  ,
==- /
null0 4
?5 6
typeof7 =
(= >
SettingsWelcomePage> Q
)Q R
:S T
selectedItemU a
.a b
PageTypeb j
)j k
;k l
} 	
} 
} �
UC:\Sources\Other\ModernKeePass\ModernKeePass\Views\MainPageFrames\WelcomePage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class 
WelcomePage  +
{		 
public

 
WelcomePage

 
(

 
)

 
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
} 
} �
BC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\AboutVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
AboutVm 
{ 
private 
readonly 
Package  
_package! )
;) *
public		 
string		 
Name		 
=>		 
_package		 &
.		& '
DisplayName		' 2
;		2 3
public 
string 
Version 
{ 	
get 
{ 
var 
version 
= 
_package &
.& '
Id' )
.) *
Version* 1
;1 2
return 
$" 
{ 
version !
.! "
Major" '
}' (
.( )
{) *
version* 1
.1 2
Minor2 7
}7 8
"8 9
;9 :
} 
} 	
public 
AboutVm 
( 
) 
: 
this 
(  
Package  '
.' (
Current( /
)/ 0
{1 2
}3 4
public 
AboutVm 
( 
Package 
package &
)& '
{ 	
_package 
= 
package 
; 
} 	
} 
} �m
IC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\CompositeKeyVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
CompositeKeyVm 
:  %
NotifyPropertyChangedBase! :
{ 
public 
enum 
StatusTypes 
{ 	
Normal 
= 
$num 
, 
Error 
= 
$num 
, 
Warning 
= 
$num 
, 
Success 
= 
$num 
} 	
public 
IDatabaseService 
Database  (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
bool 
HasPassword 
{ 	
get 
{ 
return 
_hasPassword %
;% &
}' (
set 
{ 
SetProperty 
( 
ref 
_hasPassword  ,
,, -
value. 3
)3 4
;4 5
OnPropertyChanged   !
(  ! "
$str  " +
)  + ,
;  , -
}!! 
}"" 	
public$$ 
bool$$ 

HasKeyFile$$ 
{%% 	
get&& 
{&& 
return&& 
_hasKeyFile&& $
;&&$ %
}&&& '
set'' 
{(( 
SetProperty)) 
()) 
ref)) 
_hasKeyFile))  +
,))+ ,
value))- 2
)))2 3
;))3 4
OnPropertyChanged** !
(**! "
$str**" +
)**+ ,
;**, -
}++ 
},, 	
public.. 
bool.. 
HasUserAccount.. "
{// 	
get00 
{00 
return00 
_hasUserAccount00 (
;00( )
}00* +
set11 
{22 
SetProperty33 
(33 
ref33 
_hasUserAccount33  /
,33/ 0
value331 6
)336 7
;337 8
OnPropertyChanged44 !
(44! "
$str44" +
)44+ ,
;44, -
}55 
}66 	
public88 
bool88 
IsValid88 
=>88 
!88  

_isOpening88  *
&&88+ -
(88. /
HasPassword88/ :
||88; =

HasKeyFile88> H
&&88I K
KeyFile88L S
!=88T V
null88W [
||88\ ^
HasUserAccount88_ m
)88m n
;88n o
public:: 
string:: 
Status:: 
{;; 	
get<< 
{<< 
return<< 
_status<<  
;<<  !
}<<" #
set== 
{== 
SetProperty== 
(== 
ref== !
_status==" )
,==) *
value==+ 0
)==0 1
;==1 2
}==3 4
}>> 	
public@@ 
int@@ 

StatusType@@ 
{AA 	
getBB 
{BB 
returnBB 
(BB 
intBB 
)BB 
_statusTypeBB )
;BB) *
}BB+ ,
setCC 
{CC 
SetPropertyCC 
(CC 
refCC !
_statusTypeCC" -
,CC- .
(CC/ 0
StatusTypesCC0 ;
)CC; <
valueCC< A
)CCA B
;CCB C
}CCD E
}DD 	
publicFF 
stringFF 
PasswordFF 
{GG 	
getHH 
{HH 
returnHH 
	_passwordHH "
;HH" #
}HH$ %
setII 
{JJ 
	_passwordKK 
=KK 
valueKK !
;KK! "
OnPropertyChangedLL !
(LL! "
$strLL" ?
)LL? @
;LL@ A

StatusTypeMM 
=MM 
(MM 
intMM !
)MM! "
StatusTypesMM" -
.MM- .
NormalMM. 4
;MM4 5
StatusNN 
=NN 
stringNN 
.NN  
EmptyNN  %
;NN% &
}OO 
}PP 	
publicRR 
StorageFileRR 
KeyFileRR "
{SS 	
getTT 
{TT 
returnTT 
_keyFileTT !
;TT! "
}TT# $
setUU 
{VV 
_keyFileWW 
=WW 
valueWW  
;WW  !
KeyFileTextXX 
=XX 
valueXX #
?XX# $
.XX$ %
NameXX% )
;XX) *
OnPropertyChangedYY !
(YY! "
$strYY" +
)YY+ ,
;YY, -
}ZZ 
}[[ 	
public]] 
string]] 
KeyFileText]] !
{^^ 	
get__ 
{__ 
return__ 
_keyFileText__ %
;__% &
}__' (
set`` 
{`` 
SetProperty`` 
(`` 
ref`` !
_keyFileText``" .
,``. /
value``0 5
)``5 6
;``6 7
}``8 9
}aa 	
publiccc 
GroupVmcc 
	RootGroupcc  
{cc! "
getcc# &
;cc& '
setcc( +
;cc+ ,
}cc- .
publicee 
doubleee '
PasswordComplexityIndicatoree 1
=>ee2 4
QualityEstimationee5 F
.eeF G 
EstimatePasswordBitseeG [
(ee[ \
Passwordee\ d
?eed e
.eee f
ToCharArrayeef q
(eeq r
)eer s
)ees t
;eet u
privategg 
boolgg 
_hasPasswordgg !
;gg! "
privatehh 
boolhh 
_hasKeyFilehh  
;hh  !
privateii 
boolii 
_hasUserAccountii $
;ii$ %
privatejj 
booljj 

_isOpeningjj 
;jj  
privatekk 
stringkk 
	_passwordkk  
=kk! "
stringkk# )
.kk) *
Emptykk* /
;kk/ 0
privatell 
stringll 
_statusll 
;ll 
privatemm 
StatusTypesmm 
_statusTypemm '
;mm' (
privatenn 
StorageFilenn 
_keyFilenn $
;nn$ %
privateoo 
stringoo 
_keyFileTextoo #
;oo# $
privatepp 
readonlypp 
IResourceServicepp )
	_resourcepp* 3
;pp3 4
publicrr 
CompositeKeyVmrr 
(rr 
)rr 
:rr  !
thisrr" &
(rr& '
DatabaseServicerr' 6
.rr6 7
Instancerr7 ?
,rr? @
newrrA D
ResourcesServicerrE U
(rrU V
)rrV W
)rrW X
{rrY Z
}rr[ \
publictt 
CompositeKeyVmtt 
(tt 
IDatabaseServicett .
databasett/ 7
,tt7 8
IResourceServicett9 I
resourcettJ R
)ttR S
{uu 	
	_resourcevv 
=vv 
resourcevv  
;vv  !
_keyFileTextww 
=ww 
	_resourceww $
.ww$ %
GetResourceValueww% 5
(ww5 6
$strww6 R
)wwR S
;wwS T
Databasexx 
=xx 
databasexx 
;xx  
}yy 	
public{{ 
async{{ 
Task{{ 
<{{ 
bool{{ 
>{{ 
OpenDatabase{{  ,
({{, -
bool{{- 1
	createNew{{2 ;
){{; <
{|| 	
try}} 
{~~ 

_isOpening 
= 
true !
;! "
await
�� 
Database
�� 
.
�� 
Open
�� #
(
��# $ 
CreateCompositeKey
��$ 6
(
��6 7
)
��7 8
,
��8 9
	createNew
��: C
)
��C D
;
��D E
await
�� 
Task
�� 
.
�� 
Run
�� 
(
�� 
(
��  
)
��  !
=>
��" $
	RootGroup
��% .
=
��/ 0
Database
��1 9
.
��9 :
	RootGroup
��: C
)
��C D
;
��D E
return
�� 
true
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
ArgumentException
�� $
)
��$ %
{
�� 
var
�� 
errorMessage
��  
=
��! "
new
��# &
StringBuilder
��' 4
(
��4 5
$"
��5 7
{
��7 8
	_resource
��8 A
.
��A B
GetResourceValue
��B R
(
��R S
$str
��S j
)
��j k
}
��k l
\n
��l n
"
��n o
)
��o p
;
��p q
if
�� 
(
�� 
HasPassword
�� 
)
��  
errorMessage
��! -
.
��- .

AppendLine
��. 8
(
��8 9
	_resource
��9 B
.
��B C
GetResourceValue
��C S
(
��S T
$str
��T s
)
��s t
)
��t u
;
��u v
if
�� 
(
�� 

HasKeyFile
�� 
)
�� 
errorMessage
��  ,
.
��, -

AppendLine
��- 7
(
��7 8
	_resource
��8 A
.
��A B
GetResourceValue
��B R
(
��R S
$str
��S q
)
��q r
)
��r s
;
��s t
if
�� 
(
�� 
HasUserAccount
�� "
)
��" #
errorMessage
��$ 0
.
��0 1

AppendLine
��1 ;
(
��; <
	_resource
��< E
.
��E F
GetResourceValue
��F V
(
��V W
$str
��W u
)
��u v
)
��v w
;
��w x
UpdateStatus
�� 
(
�� 
errorMessage
�� )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
StatusTypes
��6 A
.
��A B
Error
��B G
)
��G H
;
��H I
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
var
�� 
error
�� 
=
�� 
$"
�� 
{
�� 
	_resource
�� (
.
��( )
GetResourceValue
��) 9
(
��9 :
$str
��: Q
)
��Q R
}
��R S
{
��S T
e
��T U
.
��U V
Message
��V ]
}
��] ^
"
��^ _
;
��_ `
UpdateStatus
�� 
(
�� 
error
�� "
,
��" #
StatusTypes
��$ /
.
��/ 0
Error
��0 5
)
��5 6
;
��6 7
}
�� 
finally
�� 
{
�� 

_isOpening
�� 
=
�� 
false
�� "
;
��" #
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
	UpdateKey
�� 
(
�� 
)
�� 
{
�� 	
Database
�� 
.
�� 
CompositeKey
�� !
=
��" # 
CreateCompositeKey
��$ 6
(
��6 7
)
��7 8
;
��8 9
UpdateStatus
�� 
(
�� 
	_resource
�� "
.
��" #
GetResourceValue
��# 3
(
��3 4
$str
��4 I
)
��I J
,
��J K
StatusTypes
��L W
.
��W X
Success
��X _
)
��_ `
;
��` a
}
�� 	
public
�� 
void
�� 
CreateKeyFile
�� !
(
��! "
StorageFile
��" -
file
��. 2
)
��2 3
{
�� 	

KcpKeyFile
�� 
.
�� 
Create
�� 
(
�� 
file
�� "
,
��" #
null
��$ (
)
��( )
;
��) *
KeyFile
�� 
=
�� 
file
�� 
;
�� 
}
�� 	
private
�� 
void
�� 
UpdateStatus
�� !
(
��! "
string
��" (
text
��) -
,
��- .
StatusTypes
��/ :
type
��; ?
)
��? @
{
�� 	
Status
�� 
=
�� 
text
�� 
;
�� 

StatusType
�� 
=
�� 
(
�� 
int
�� 
)
�� 
type
�� "
;
��" #
}
�� 	
private
�� 
CompositeKey
��  
CreateCompositeKey
�� /
(
��/ 0
)
��0 1
{
�� 	
var
�� 
compositeKey
�� 
=
�� 
new
�� "
CompositeKey
��# /
(
��/ 0
)
��0 1
;
��1 2
if
�� 
(
�� 
HasPassword
�� 
)
�� 
compositeKey
�� )
.
��) *

AddUserKey
��* 4
(
��4 5
new
��5 8
KcpPassword
��9 D
(
��D E
Password
��E M
)
��M N
)
��N O
;
��O P
if
�� 
(
�� 

HasKeyFile
�� 
&&
�� 
KeyFile
�� %
!=
��& (
null
��) -
)
��- .
compositeKey
��/ ;
.
��; <

AddUserKey
��< F
(
��F G
new
��G J

KcpKeyFile
��K U
(
��U V
IOConnectionInfo
��V f
.
��f g
FromFile
��g o
(
��o p
KeyFile
��p w
)
��w x
)
��x y
)
��y z
;
��z {
if
�� 
(
�� 
HasUserAccount
�� 
)
�� 
compositeKey
��  ,
.
��, -

AddUserKey
��- 7
(
��7 8
new
��8 ;
KcpUserAccount
��< J
(
��J K
)
��K L
)
��L M
;
��M N
return
�� 
compositeKey
�� 
;
��  
}
�� 	
}
�� 
}�� �
OC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\Items\ListMenuItemVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
ListMenuItemVm 
:  !%
NotifyPropertyChangedBase" ;
,; <

IIsEnabled= G
,G H
ISelectableModelI Y
{		 
private

 
bool

 
_isSelected

  
;

  !
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Group 
{ 
get !
;! "
set# &
;& '
}( )
=* +
$str, /
;/ 0
public 
Type 
PageType 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Symbol 

SymbolIcon  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
	IsEnabled 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
true. 2
;2 3
public 
bool 

IsSelected 
{ 	
get 
{ 
return 
_isSelected $
;$ %
}& '
set 
{ 
SetProperty 
( 
ref !
_isSelected" -
,- .
value/ 4
)4 5
;5 6
}7 8
} 	
public 
override 
string 
ToString '
(' (
)( )
{ 	
return 
Title 
; 
} 	
} 
} �
OC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\Items\MainMenuItemVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
MainMenuItemVm 
:  
ListMenuItemVm! /
{ 
public 
object 
	Parameter 
{  !
get" %
;% &
set' *
;* +
}, -
public 
Frame 
Destination  
{! "
get# &
;& '
set( +
;+ ,
}- .
}		 
}

 �
MC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\Items\RecentItemVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
RecentItemVm 
: %
NotifyPropertyChangedBase 8
,8 9
ISelectableModel: J
,J K
IRecentItemL W
{		 
private

 
bool

 
_isSelected

  
;

  !
public 
StorageFile 
DatabaseFile '
{( )
get* -
;- .
}/ 0
public 
string 
Token 
{ 
get !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
}" #
public 
string 
Path 
=> 
DatabaseFile *
?* +
.+ ,
Path, 0
;0 1
public 
bool 

IsSelected 
{ 	
get 
{ 
return 
_isSelected $
;$ %
}& '
set 
{ 
SetProperty 
( 
ref !
_isSelected" -
,- .
value/ 4
)4 5
;5 6
}7 8
} 	
public 
RecentItemVm 
( 
) 
{ 
}  
public 
RecentItemVm 
( 
string "
token# (
,( )
string* 0
metadata1 9
,9 :
IStorageItem; G
fileH L
)L M
{ 	
Token 
= 
token 
; 
Name 
= 
metadata 
; 
DatabaseFile 
= 
file 
as  "
StorageFile# .
;. /
} 	
public 
void 
OpenDatabaseFile $
($ %
)% &
{   	
OpenDatabaseFile!! 
(!! 
DatabaseService!! ,
.!!, -
Instance!!- 5
)!!5 6
;!!6 7
}"" 	
public$$ 
void$$ 
OpenDatabaseFile$$ $
($$$ %
IDatabaseService$$% 5
database$$6 >
)$$> ?
{%% 	
database&& 
.&& 
DatabaseFile&& !
=&&" #
DatabaseFile&&$ 0
;&&0 1
}'' 	
public)) 
void)) 
UpdateAccessTime)) $
())$ %
)))% &
{** 	
UpdateAccessTime++ 
(++ 
RecentService++ *
.++* +
Instance+++ 3
)++3 4
;++4 5
},, 	
public.. 
async.. 
void.. 
UpdateAccessTime.. *
(..* +
IRecentService..+ 9
recent..: @
)..@ A
{// 	
await00 
recent00 
.00 
GetFileAsync00 %
(00% &
Token00& +
)00+ ,
;00, -
}11 	
}22 
}33 �;
JC:\Sources\Other\ModernKeePass\ModernKeePass\Views\EntryDetailPage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class 
EntryDetailPage  /
{ 
public 
EntryVm 
Model 
=> 
(  !
EntryVm! (
)( )
DataContext* 5
;5 6
public 
NavigationHelper 
NavigationHelper  0
{1 2
get3 6
;6 7
}8 9
public 
EntryDetailPage 
( 
)  
{ 	
InitializeComponent 
(  
)  !
;! "
NavigationHelper 
= 
new "
NavigationHelper# 3
(3 4
this4 8
)8 9
;9 :
NavigationHelper 
. 
	LoadState &
+=' )&
navigationHelper_LoadState* D
;D E
}   	
private-- 
void-- &
navigationHelper_LoadState-- /
(--/ 0
object--0 6
sender--7 =
,--= >
LoadStateEventArgs--? Q
e--R S
)--S T
{--U V
}--V W
	protected:: 
override:: 
void:: 
OnNavigatedTo::  -
(::- .
NavigationEventArgs::. A
e::B C
)::C D
{;; 	
NavigationHelper<< 
.<< 
OnNavigatedTo<< *
(<<* +
e<<+ ,
)<<, -
;<<- .
if== 
(== 
!== 
(== 
e== 
.== 
	Parameter== 
is==  
EntryVm==! (
)==( )
)==) *
return==+ 1
;==1 2
DataContext>> 
=>> 
(>> 
EntryVm>> "
)>>" #
e>># $
.>>$ %
	Parameter>>% .
;>>. /
}?? 	
	protectedAA 
overrideAA 
voidAA 
OnNavigatedFromAA  /
(AA/ 0
NavigationEventArgsAA0 C
eAAD E
)AAE F
{BB 	
NavigationHelperCC 
.CC 
OnNavigatedFromCC ,
(CC, -
eCC- .
)CC. /
;CC/ 0
}DD 	
privateHH 
voidHH 
DeleteButton_ClickHH '
(HH' (
objectHH( .
senderHH/ 5
,HH5 6
RoutedEventArgsHH7 F
eHHG H
)HHH I
{II 	
varJJ 
resourceJJ 
=JJ 
newJJ 
ResourcesServiceJJ /
(JJ/ 0
)JJ0 1
;JJ1 2
varKK 
messageKK 
=KK 
ModelKK 
.KK  
IsRecycleOnDeleteKK  1
?LL 
resourceLL 
.LL 
GetResourceValueLL +
(LL+ ,
$strLL, H
)LLH I
:MM 
resourceMM 
.MM 
GetResourceValueMM +
(MM+ ,
$strMM, G
)MMG H
;MMH I
varNN 
textNN 
=NN 
ModelNN 
.NN 
IsRecycleOnDeleteNN .
?NN/ 0
resourceNN1 9
.NN9 :
GetResourceValueNN: J
(NNJ K
$strNNK Z
)NNZ [
:NN\ ]
resourceNN^ f
.NNf g
GetResourceValueNNg w
(NNw x
$str	NNx �
)
NN� �
;
NN� �
MessageDialogHelperOO 
.OO  
ShowActionDialogOO  0
(OO0 1
resourceOO1 9
.OO9 :
GetResourceValueOO: J
(OOJ K
$strOOK ^
)OO^ _
,OO_ `
messageOOa h
,OOh i
resourcePP 
.PP 
GetResourceValuePP )
(PP) *
$strPP* D
)PPD E
,PPE F
resourceQQ 
.QQ 
GetResourceValueQQ )
(QQ) *
$strQQ* D
)QQD E
,QQE F
aQQG H
=>QQI K
{RR #
ToastNotificationHelperSS '
.SS' (
ShowMovedToastSS( 6
(SS6 7
ModelSS7 <
,SS< =
resourceSS> F
.SSF G
GetResourceValueSSG W
(SSW X
$strSSX h
)SSh i
,SSi j
textSSk o
)SSo p
;SSp q
ModelTT 
.TT 
MarkForDeleteTT #
(TT# $
resourceTT$ ,
.TT, -
GetResourceValueTT- =
(TT= >
$strTT> O
)TTO P
)TTP Q
;TTQ R
ifUU 
(UU 
FrameUU 
.UU 
	CanGoBackUU #
)UU# $
FrameUU% *
.UU* +
GoBackUU+ 1
(UU1 2
)UU2 3
;UU3 4
}VV 
,VV 
nullVV 
)VV 
;VV 
}WW 	
privateYY 
voidYY 
RestoreButton_ClickYY (
(YY( )
objectYY) /
senderYY0 6
,YY6 7
RoutedEventArgsYY8 G
eYYH I
)YYI J
{ZZ 	
var[[ 
resource[[ 
=[[ 
new[[ 
ResourcesService[[ /
([[/ 0
)[[0 1
;[[1 2#
ToastNotificationHelper\\ #
.\\# $
ShowMovedToast\\$ 2
(\\2 3
Model\\3 8
,\\8 9
resource\\: B
.\\B C
GetResourceValue\\C S
(\\S T
$str\\T i
)\\i j
,\\j k
resource\\l t
.\\t u
GetResourceValue	\\u �
(
\\� �
$str
\\� �
)
\\� �
)
\\� �
;
\\� �
if]] 
(]] 
Frame]] 
.]] 
	CanGoBack]] 
)]]  
Frame]]! &
.]]& '
GoBack]]' -
(]]- .
)]]. /
;]]/ 0
}^^ 	
private`` 
void`` )
EntryDetailPage_OnSizeChanged`` 2
(``2 3
object``3 9
sender``: @
,``@ A 
SizeChangedEventArgs``B V
e``W X
)``X Y
{aa 	
VisualStateManagerbb 
.bb 
	GoToStatebb (
(bb( )
thisbb) -
,bb- .
ebb/ 0
.bb0 1
NewSizebb1 8
.bb8 9
Widthbb9 >
<bb? @
$numbbA D
?bbE F
$strbbG N
:bbO P
$strbbQ X
,bbX Y
truebbZ ^
)bb^ _
;bb_ `
}cc 	
privateee 
voidee 7
+HamburgerMenuUserControl_OnSelectionChangedee @
(ee@ A
objecteeA G
sendereeH N
,eeN O%
SelectionChangedEventArgseeP i
eeej k
)eek l
{ff 	
vargg 
listViewgg 
=gg 
sendergg !
asgg" $
ListViewgg% -
;gg- .
EntryVmhh 
entryhh 
;hh 
switchii 
(ii 
listViewii 
?ii 
.ii 
SelectedIndexii +
)ii+ ,
{jj 
casekk 
-kk 
$numkk 
:kk 
returnll 
;ll 
defaultmm 
:mm 
entrynn 
=nn 
listViewnn $
?nn$ %
.nn% &
SelectedItemnn& 2
asnn3 5
EntryVmnn6 =
;nn= >
breakoo 
;oo 
}pp 

StackPanelrr 
.rr 
DataContextrr "
=rr# $
entryrr% *
;rr* +
}ss 	
}tt 
}uu �r
JC:\Sources\Other\ModernKeePass\ModernKeePass\Views\GroupDetailPage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class 
GroupDetailPage  /
{ 
public 
NavigationHelper 
NavigationHelper  0
{1 2
get3 6
;6 7
}8 9
public 
GroupVm 
Model 
=> 
(  !
GroupVm! (
)( )
DataContext) 4
;4 5
public 
GroupDetailPage 
( 
)  
{ 	
InitializeComponent   
(    
)    !
;  ! "
NavigationHelper!! 
=!! 
new!! "
NavigationHelper!!# 3
(!!3 4
this!!4 8
)!!8 9
;!!9 :
NavigationHelper"" 
."" 
	LoadState"" &
+=""' )&
navigationHelper_LoadState""* D
;""D E
}## 	
private00 
void00 &
navigationHelper_LoadState00 /
(00/ 0
object000 6
sender007 =
,00= >
LoadStateEventArgs00? Q
e00R S
)00S T
{00U V
}00V W
	protected== 
override== 
void== 
OnNavigatedTo==  -
(==- .
NavigationEventArgs==. A
e==B C
)==C D
{>> 	
NavigationHelper?? 
.?? 
OnNavigatedTo?? *
(??* +
e??+ ,
)??, -
;??- .
ifAA 
(AA 
eAA 
.AA 
	ParameterAA 
isAA 
PasswordEventArgsAA 0
)AA0 1
DataContextBB 
=BB 
(BB 
(BB  
PasswordEventArgsBB  1
)BB1 2
eBB3 4
.BB4 5
	ParameterBB5 >
)BB> ?
.BB? @
	RootGroupBB@ I
;BBI J
elseCC 
ifCC 
(CC 
eCC 
.CC 
	ParameterCC  
isCC! #
GroupVmCC$ +
)CC+ ,
DataContextDD 
=DD 
(DD 
GroupVmDD &
)DD& '
eDD( )
.DD) *
	ParameterDD* 3
;DD3 4
}EE 	
	protectedGG 
overrideGG 
voidGG 
OnNavigatedFromGG  /
(GG/ 0
NavigationEventArgsGG0 C
eGGD E
)GGE F
{HH 	
NavigationHelperII 
.II 
OnNavigatedFromII ,
(II, -
eII- .
)II. /
;II/ 0
}JJ 	
privatePP 
voidPP #
groups_SelectionChangedPP ,
(PP, -
objectPP- 3
senderPP4 :
,PP: ;%
SelectionChangedEventArgsPP< U
ePPV W
)PPW X
{QQ 	
varRR 
listViewRR 
=RR 
senderRR !
asRR" $
ListViewRR% -
;RR- .
GroupVmSS 
groupSS 
;SS 
switchTT 
(TT 
listViewTT 
?TT 
.TT 
SelectedIndexTT +
)TT+ ,
{UU 
caseVV 
-VV 
$numVV 
:VV 
returnWW 
;WW 
defaultXX 
:XX 
groupYY 
=YY 
listViewYY $
?YY$ %
.YY% &
SelectedItemYY& 2
asYY3 5
GroupVmYY6 =
;YY= >
breakZZ 
;ZZ 
}[[ 
Frame\\ 
.\\ 
Navigate\\ 
(\\ 
typeof\\ !
(\\! "
GroupDetailPage\\" 1
)\\1 2
,\\2 3
group\\4 9
)\\9 :
;\\: ;
}]] 	
private__ 
void__ $
entries_SelectionChanged__ -
(__- .
object__. 4
sender__5 ;
,__; <%
SelectionChangedEventArgs__= V
e__W X
)__X Y
{`` 	
EntryVmaa 
entryaa 
;aa 
switchbb 
(bb 
GridViewbb 
.bb 
SelectedIndexbb *
)bb* +
{cc 
casedd 
-dd 
$numdd 
:dd 
returnee 
;ee 
defaultff 
:ff 
entrygg 
=gg 
GridViewgg $
.gg$ %
SelectedItemgg% 1
asgg2 4
EntryVmgg5 <
;gg< =
breakhh 
;hh 
}ii 
Framejj 
.jj 
Navigatejj 
(jj 
typeofjj !
(jj! "
EntryDetailPagejj" 1
)jj1 2
,jj2 3
entryjj4 9
)jj9 :
;jj: ;
}kk 	
privatemm 
voidmm 
DeleteButton_Clickmm '
(mm' (
objectmm( .
sendermm/ 5
,mm5 6
RoutedEventArgsmm7 F
emmG H
)mmH I
{nn 	
varoo 
resourceoo 
=oo 
newoo 
ResourcesServiceoo /
(oo/ 0
)oo0 1
;oo1 2
varpp 
messagepp 
=pp 
Modelpp 
.pp  
IsRecycleOnDeletepp  1
?qq 
resourceqq 
.qq 
GetResourceValueqq +
(qq+ ,
$strqq, H
)qqH I
:rr 
resourcerr 
.rr 
GetResourceValuerr +
(rr+ ,
$strrr, G
)rrG H
;rrH I
varss 
textss 
=ss 
Modelss 
.ss 
IsRecycleOnDeletess .
?ss/ 0
resourcess1 9
.ss9 :
GetResourceValuess: J
(ssJ K
$strssK Z
)ssZ [
:ss\ ]
resourcess^ f
.ssf g
GetResourceValuessg w
(ssw x
$str	ssx �
)
ss� �
;
ss� �
MessageDialogHelpertt 
.tt  
ShowActionDialogtt  0
(tt0 1
resourcett1 9
.tt9 :
GetResourceValuett: J
(ttJ K
$strttK ^
)tt^ _
,tt_ `
messagetta h
,tth i
resourceuu 
.uu 
GetResourceValueuu )
(uu) *
$struu* D
)uuD E
,uuE F
resourcevv 
.vv 
GetResourceValuevv )
(vv) *
$strvv* D
)vvD E
,vvE F
avvG H
=>vvI K
{ww #
ToastNotificationHelperxx +
.xx+ ,
ShowMovedToastxx, :
(xx: ;
Modelxx; @
,xx@ A
resourcexxB J
.xxJ K
GetResourceValuexxK [
(xx[ \
$strxx\ l
)xxl m
,xxm n
textxxo s
)xxs t
;xxt u
Modelyy 
.yy 
MarkForDeleteyy '
(yy' (
resourceyy( 0
.yy0 1
GetResourceValueyy1 A
(yyA B
$stryyB S
)yyS T
)yyT U
;yyU V
ifzz 
(zz 
Framezz 
.zz 
	CanGoBackzz '
)zz' (
Framezz) .
.zz. /
GoBackzz/ 5
(zz5 6
)zz6 7
;zz7 8
}{{ 
,{{ 
null{{ 
){{ 
;{{ 
}|| 	
private~~ 
void~~ 
RestoreButton_Click~~ (
(~~( )
object~~) /
sender~~0 6
,~~6 7
RoutedEventArgs~~8 G
e~~H I
)~~I J
{ 	
var
�� 
resource
�� 
=
�� 
new
�� 
ResourcesService
�� /
(
��/ 0
)
��0 1
;
��1 2%
ToastNotificationHelper
�� #
.
��# $
ShowMovedToast
��$ 2
(
��2 3
Model
��3 8
,
��8 9
resource
��: B
.
��B C
GetResourceValue
��C S
(
��S T
$str
��T i
)
��i j
,
��j k
resource
�� 
.
�� 
GetResourceValue
�� )
(
��) *
$str
��* 9
)
��9 :
)
��: ;
;
��; <
if
�� 
(
�� 
Frame
�� 
.
�� 
	CanGoBack
�� 
)
��  
Frame
��! &
.
��& '
GoBack
��' -
(
��- .
)
��. /
;
��/ 0
}
�� 	
private
�� 
void
�� ,
SemanticZoom_ViewChangeStarted
�� 3
(
��3 4
object
��4 :
sender
��; A
,
��A B.
 SemanticZoomViewChangedEventArgs
��C c
e
��d e
)
��e f
{
�� 	
if
�� 
(
�� 
e
�� 
.
�� "
IsSourceZoomedInView
�� &
==
��' )
false
��* /
)
��/ 0
{
�� 
e
�� 
.
�� 
DestinationItem
�� !
.
��! "
Item
��" &
=
��' (
e
��) *
.
��* +

SourceItem
��+ 5
.
��5 6
Item
��6 :
;
��: ;
}
�� 
}
�� 	
private
�� 
void
�� %
CreateEntry_ButtonClick
�� ,
(
��, -
object
��- 3
sender
��4 :
,
��: ;
RoutedEventArgs
��< K
e
��L M
)
��M N
{
�� 	
Frame
�� 
.
�� 
Navigate
�� 
(
�� 
typeof
�� !
(
��! "
EntryDetailPage
��" 1
)
��1 2
,
��2 3
Model
��4 9
.
��9 :
AddNewEntry
��: E
(
��E F
)
��F G
)
��G H
;
��H I
}
�� 	
private
�� 
void
�� %
CreateGroup_ButtonClick
�� ,
(
��, -
object
��- 3
sender
��4 :
,
��: ;
RoutedEventArgs
��< K
e
��L M
)
��M N
{
�� 	
Frame
�� 
.
�� 
Navigate
�� 
(
�� 
typeof
�� !
(
��! "
GroupDetailPage
��" 1
)
��1 2
,
��2 3
Model
��4 9
.
��9 :
AddNewGroup
��: E
(
��E F
)
��F G
)
��G H
;
��H I
}
�� 	
private
�� 
void
�� (
GridView_DragItemsStarting
�� /
(
��/ 0
object
��0 6
sender
��7 =
,
��= >(
DragItemsStartingEventArgs
��? Y
e
��Z [
)
��[ \
{
�� 	
e
�� 
.
�� 
Cancel
�� 
=
�� 
!
�� 
Model
�� 
.
�� 

IsEditMode
�� (
;
��( )
e
�� 
.
�� 
Data
�� 
.
��  
RequestedOperation
�� %
=
��& '"
DataPackageOperation
��( <
.
��< =
Move
��= A
;
��A B
}
�� 	
private
�� 
void
�� .
 SearchBox_OnSuggestionsRequested
�� 5
(
��5 6
	SearchBox
��6 ?
sender
��@ F
,
��F G4
&SearchBoxSuggestionsRequestedEventArgs
��H n
args
��o s
)
��s t
{
�� 	
var
�� 
imageUri
�� 
=
�� )
RandomAccessStreamReference
�� 6
.
��6 7
CreateFromUri
��7 D
(
��D E
new
��E H
Uri
��I L
(
��L M
$str��M �
)��� �
)��� �
;��� �
var
�� 
results
�� 
=
�� 
Model
�� 
.
��  

SubEntries
��  *
.
��* +
Where
��+ 0
(
��0 1
e
��1 2
=>
��3 5
e
��6 7
.
��7 8
Name
��8 <
.
��< =
IndexOf
��= D
(
��D E
args
��E I
.
��I J
	QueryText
��J S
,
��S T
StringComparison
��U e
.
��e f
OrdinalIgnoreCase
��f w
)
��w x
>=
��y {
$num
��| }
)
��} ~
.
��~ 
Take�� �
(��� �
$num��� �
)��� �
;��� �
foreach
�� 
(
�� 
var
�� 
result
�� 
in
��  "
results
��# *
)
��* +
{
�� 
args
�� 
.
�� 
Request
�� 
.
�� (
SearchSuggestionCollection
�� 7
.
��7 8$
AppendResultSuggestion
��8 N
(
��N O
result
��O U
.
��U V
Name
��V Z
,
��Z [
result
��\ b
.
��b c
ParentGroup
��c n
.
��n o
Name
��o s
,
��s t
result
��u {
.
��{ |
Id
��| ~
,
��~ 
imageUri��� �
,��� �
string��� �
.��� �
Empty��� �
)��� �
;��� �
}
�� 
}
�� 	
private
�� 
void
�� 0
"SearchBox_OnResultSuggestionChosen
�� 7
(
��7 8
	SearchBox
��8 A
sender
��B H
,
��H I6
(SearchBoxResultSuggestionChosenEventArgs
��J r
args
��s w
)
��w x
{
�� 	
var
�� 
entry
�� 
=
�� 
Model
�� 
.
�� 

SubEntries
�� (
.
��( )
FirstOrDefault
��) 7
(
��7 8
e
��8 9
=>
��: <
e
��= >
.
��> ?
Id
��? A
==
��B D
args
��E I
.
��I J
Tag
��J M
)
��M N
;
��N O
Frame
�� 
.
�� 
Navigate
�� 
(
�� 
typeof
�� !
(
��! "
EntryDetailPage
��" 1
)
��1 2
,
��2 3
entry
��4 9
)
��9 :
;
��: ;
}
�� 	
private
�� 
void
�� +
GroupDetailPage_OnSizeChanged
�� 2
(
��2 3
object
��3 9
sender
��: @
,
��@ A"
SizeChangedEventArgs
��B V
e
��W X
)
��X Y
{
�� 	 
VisualStateManager
�� 
.
�� 
	GoToState
�� (
(
��( )
this
��) -
,
��- .
e
��/ 0
.
��0 1
NewSize
��1 8
.
��8 9
Width
��9 >
<
��? @
$num
��A D
?
��E F
$str
��G N
:
��O P
$str
��Q X
,
��X Y
true
��Z ^
)
��^ _
;
��_ `
}
�� 	
}
�� 
}�� �
ZC:\Sources\Other\ModernKeePass\ModernKeePass\Views\MainPageFrames\OpenDatabasePage.xaml.cs
	namespace

 	
ModernKeePass


 
.

 
Views

 
{ 
public 

sealed 
partial 
class 
OpenDatabasePage  0
{ 
private 
Frame 

_mainFrame  
;  !
public 
OpenVm 
Model 
=> 
(  
OpenVm  &
)& '
DataContext' 2
;2 3
public 
OpenDatabasePage 
(  
)  !
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
	protected 
override 
void 
OnNavigatedTo  -
(- .
NavigationEventArgs. A
eB C
)C D
{ 	
base 
. 
OnNavigatedTo 
( 
e  
)  !
;! "

_mainFrame 
= 
e 
. 
	Parameter $
as% '
Frame( -
;- .
} 	
private   
async   
void   
ButtonBase_OnClick   -
(  - .
object  . 4
sender  5 ;
,  ; <
RoutedEventArgs  = L
e  M N
)  N O
{!! 	
var"" 
picker"" 
="" 
new## 
FileOpenPicker## "
{$$ 
ViewMode%% 
=%% 
PickerViewMode%% -
.%%- .
List%%. 2
,%%2 3"
SuggestedStartLocation&& *
=&&+ ,
PickerLocationId&&- =
.&&= >
DocumentsLibrary&&> N
}'' 
;'' 
picker(( 
.(( 
FileTypeFilter(( !
.((! "
Add((" %
(((% &
$str((& -
)((- .
;((. /
var++ 
file++ 
=++ 
await++ 
picker++ #
.++# $
PickSingleFileAsync++$ 7
(++7 8
)++8 9
;++9 :
if,, 
(,, 
file,, 
==,, 
null,, 
),, 
return,, $
;,,$ %
Model-- 
.-- 
OpenFile-- 
(-- 
file-- 
)--  
;--  !
}.. 	
}// 
}00 �
]C:\Sources\Other\ModernKeePass\ModernKeePass\Views\MainPageFrames\RecentDatabasesPage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class 
RecentDatabasesPage  3
{		 
public

 
RecentDatabasesPage

 "
(

" #
)

# $
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
} 
} �
ZC:\Sources\Other\ModernKeePass\ModernKeePass\Views\MainPageFrames\SaveDatabasePage.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
{ 
public 

sealed 
partial 
class 
SaveDatabasePage  0
{ 
private 
Frame 

_mainFrame  
;  !
public 
SaveVm 
Model 
=> 
(  
SaveVm  &
)& '
DataContext' 2
;2 3
public 
SaveDatabasePage 
(  
)  !
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
	protected 
override 
void 
OnNavigatedTo  -
(- .
NavigationEventArgs. A
eB C
)C D
{ 	
base 
. 
OnNavigatedTo 
( 
e  
)  !
;! "

_mainFrame 
= 
e 
. 
	Parameter $
as% '
Frame( -
;- .
} 	
private 
async 
void 
SaveButton_OnClick -
(- .
object. 4
sender5 ;
,; <
RoutedEventArgs= L
eM N
)N O
{   	
await!! 
Model!! 
.!! 
Save!! 
(!! 
)!! 
;!! 

_mainFrame"" 
."" 
Navigate"" 
(""  
typeof""  &
(""& '
MainPage""' /
)""/ 0
)""0 1
;""1 2
}## 	
private%% 
async%% 
void%%  
SaveAsButton_OnClick%% /
(%%/ 0
object%%0 6
sender%%7 =
,%%= >
RoutedEventArgs%%? N
e%%O P
)%%P Q
{&& 	
var'' 

savePicker'' 
='' 
new''  
FileSavePicker''! /
{(( "
SuggestedStartLocation)) &
=))' (
PickerLocationId))) 9
.))9 :
DocumentsLibrary)): J
,))J K
SuggestedFileName** !
=**" #
$str**$ 2
}++ 
;++ 

savePicker,, 
.,, 
FileTypeChoices,, &
.,,& '
Add,,' *
(,,* +
$str,,+ A
,,,A B
new,,C F
List,,G K
<,,K L
string,,L R
>,,R S
{,,T U
$str,,V ]
},,^ _
),,_ `
;,,` a
var.. 
file.. 
=.. 
await.. 

savePicker.. '
...' (
PickSaveFileAsync..( 9
(..9 :
)..: ;
;..; <
if// 
(// 
file// 
==// 
null// 
)// 
return// $
;//$ %
Model00 
.00 
Save00 
(00 
file00 
)00 
;00 

_mainFrame22 
.22 
Navigate22 
(22  
typeof22  &
(22& '
MainPage22' /
)22/ 0
)220 1
;221 2
}33 	
}44 
}55 �
GC:\Sources\Other\ModernKeePass\ModernKeePass\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str (
)( )
]) *
[ 
assembly 	
:	 

AssemblyDescription 
( 
$str b
)b c
]c d
[		 
assembly		 	
:			 
!
AssemblyConfiguration		  
(		  !
$str		! #
)		# $
]		$ %
[

 
assembly

 	
:

	 

AssemblyCompany

 
(

 
$str

 #
)

# $
]

$ %
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str *
)* +
]+ ,
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str /
)/ 0
]0 1
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 

AssemblyVersion 
( 
$str %
)% &
]& '
[ 
assembly 	
:	 

AssemblyFileVersion 
( 
$str )
)) *
]* +
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] ��
BC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\EntryVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
EntryVm 
: "
INotifyPropertyChanged 1
,1 2
	IPwEntity3 <
,< =
ISelectableModel> N
{ 
public 
GroupVm 
ParentGroup "
{# $
get% (
;( )
private* 1
set2 5
;5 6
}7 8
public 
GroupVm 
PreviousGroup $
{% &
get' *
;* +
private, 3
set4 7
;7 8
}9 :
public 
System 
. 
Drawing 
. 
Color #
?# $
BackgroundColor% 4
=>5 7
_pwEntry8 @
?@ A
.A B
BackgroundColorB Q
;Q R
public 
System 
. 
Drawing 
. 
Color #
?# $
ForegroundColor% 4
=>5 7
_pwEntry8 @
?@ A
.A B
ForegroundColorB Q
;Q R
public 
bool #
IsRevealPasswordEnabled +
=>, .
!/ 0
string0 6
.6 7
IsNullOrEmpty7 D
(D E
PasswordE M
)M N
;N O
public 
bool 

HasExpired 
=> !
HasExpirationDate" 3
&&4 6
_pwEntry7 ?
.? @

ExpiryTime@ J
<K L
DateTimeM U
.U V
NowV Y
;Y Z
public 
double '
PasswordComplexityIndicator 1
=>2 4
QualityEstimation5 F
.F G 
EstimatePasswordBitsG [
([ \
Password\ d
?d e
.e f
ToCharArrayf q
(q r
)r s
)s t
;t u
public 
bool $
UpperCasePatternSelected ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
=; <
true= A
;A B
public 
bool $
LowerCasePatternSelected ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
=; <
true= A
;A B
public 
bool !
DigitsPatternSelected )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
=8 9
true: >
;> ?
public 
bool  
MinusPatternSelected (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
bool %
UnderscorePatternSelected -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
bool  
SpacePatternSelected (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
bool "
SpecialPatternSelected *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
bool #
BracketsPatternSelected +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
string 
CustomChars !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
public   
PwUuid   
IdUuid   
=>   
_pwEntry    (
?  ( )
.  ) *
Uuid  * .
;  . /
public!! 
string!! 
Id!! 
=>!! 
_pwEntry!! $
?!!$ %
.!!% &
Uuid!!& *
.!!* +
ToHexString!!+ 6
(!!6 7
)!!7 8
;!!8 9
public"" 
bool"" 
IsRecycleOnDelete"" %
=>""& (
	_database"") 2
.""2 3
RecycleBinEnabled""3 D
&&""E G
!""H I
ParentGroup""I T
.""T U

IsSelected""U _
;""_ `
public## 
IEnumerable## 
<## 
	IPwEntity## $
>##$ %

BreadCrumb##& 0
=>##1 3
new##4 7
List##8 <
<##< =
	IPwEntity##= F
>##F G
(##G H
ParentGroup##H S
.##S T

BreadCrumb##T ^
)##^ _
{##` a
ParentGroup##a l
}##l m
;##m n
public'' 
bool'' 

IsSelected'' 
{''  
get''! $
;''$ %
set''& )
;'') *
}''+ ,
=''- .
true''/ 3
;''3 4
public)) 
double)) 
PasswordLength)) $
{** 	
get++ 
{++ 
return++ 
_passwordLength++ (
;++( )
}++* +
set,, 
{-- 
_passwordLength.. 
=..  !
value.." '
;..' (!
NotifyPropertyChanged// %
(//% &
$str//& 6
)//6 7
;//7 8
}00 
}11 	
public33 
string33 
Name33 
{44 	
get55 
{55 
return55 
GetEntryValue55 &
(55& '
PwDefs55' -
.55- .

TitleField55. 8
)558 9
;559 :
}55; <
set66 
{66 
SetEntryValue66 
(66  
PwDefs66  &
.66& '

TitleField66' 1
,661 2
value663 8
)668 9
;669 :
}66; <
}77 	
public:: 
string:: 
UserName:: 
{;; 	
get<< 
{<< 
return<< 
GetEntryValue<< &
(<<& '
PwDefs<<' -
.<<- .
UserNameField<<. ;
)<<; <
;<<< =
}<<> ?
set== 
{== 
SetEntryValue== 
(==  
PwDefs==  &
.==& '
UserNameField==' 4
,==4 5
value==6 ;
)==; <
;==< =
}==> ?
}>> 	
public@@ 
string@@ 
Password@@ 
{AA 	
getBB 
{BB 
returnBB 
GetEntryValueBB &
(BB& '
PwDefsBB' -
.BB- .
PasswordFieldBB. ;
)BB; <
;BB< =
}BB> ?
setCC 
{DD 
SetEntryValueEE 
(EE 
PwDefsEE $
.EE$ %
PasswordFieldEE% 2
,EE2 3
valueEE4 9
)EE9 :
;EE: ;!
NotifyPropertyChangedFF %
(FF% &
$strFF& 0
)FF0 1
;FF1 2!
NotifyPropertyChangedGG %
(GG% &
$strGG& C
)GGC D
;GGD E
}HH 
}II 	
publicKK 
stringKK 
UrlKK 
{LL 	
getMM 
{MM 
returnMM 
GetEntryValueMM &
(MM& '
PwDefsMM' -
.MM- .
UrlFieldMM. 6
)MM6 7
;MM7 8
}MM9 :
setNN 
{NN 
SetEntryValueNN 
(NN  
PwDefsNN  &
.NN& '
UrlFieldNN' /
,NN/ 0
valueNN1 6
)NN6 7
;NN7 8
}NN9 :
}OO 	
publicQQ 
stringQQ 
NotesQQ 
{RR 	
getSS 
{SS 
returnSS 
GetEntryValueSS &
(SS& '
PwDefsSS' -
.SS- .

NotesFieldSS. 8
)SS8 9
;SS9 :
}SS; <
setTT 
{TT 
SetEntryValueTT 
(TT  
PwDefsTT  &
.TT& '

NotesFieldTT' 1
,TT1 2
valueTT3 8
)TT8 9
;TT9 :
}TT; <
}UU 	
publicWW 
intWW 
IconIdWW 
{XX 	
getYY 
{ZZ 
if[[ 
([[ 
_pwEntry[[ 
?[[ 
.[[ 
IconId[[ $
!=[[% '
null[[( ,
)[[, -
return[[. 4
([[5 6
int[[6 9
)[[9 :
_pwEntry[[; C
?[[C D
.[[D E
IconId[[E K
;[[K L
return\\ 
-\\ 
$num\\ 
;\\ 
}]] 
}^^ 	
public`` 
DateTimeOffset`` 

ExpiryDate`` (
{aa 	
getbb 
{bb 
returnbb 
newbb 
DateTimeOffsetbb +
(bb+ ,
_pwEntrybb, 4
.bb4 5

ExpiryTimebb5 ?
.bb? @
Datebb@ D
)bbD E
;bbE F
}bbG H
setcc 
{cc 
ifcc 
(cc 
HasExpirationDatecc '
)cc' (
_pwEntrycc) 1
.cc1 2

ExpiryTimecc2 <
=cc= >
valuecc? D
.ccD E
DateTimeccE M
;ccM N
}ccO P
}dd 	
publicff 
TimeSpanff 

ExpiryTimeff "
{gg 	
gethh 
{hh 
returnhh 
_pwEntryhh !
.hh! "

ExpiryTimehh" ,
.hh, -
	TimeOfDayhh- 6
;hh6 7
}hh8 9
setii 
{ii 
ifii 
(ii 
HasExpirationDateii '
)ii' (
_pwEntryii) 1
.ii1 2

ExpiryTimeii2 <
=ii= >
_pwEntryii? G
.iiG H

ExpiryTimeiiH R
.iiR S
DateiiS W
.iiW X
AddiiX [
(ii[ \
valueii\ a
)iia b
;iib c
}iid e
}jj 	
publicll 
boolll 

IsEditModell 
{mm 	
getnn 
{nn 
returnnn 

IsSelectednn #
&&nn$ &
_isEditModenn' 2
;nn2 3
}nn4 5
setoo 
{pp 
_isEditModeqq 
=qq 
valueqq #
;qq# $!
NotifyPropertyChangedrr %
(rr% &
$strrr& 2
)rr2 3
;rr3 4
}ss 
}tt 	
publicvv 
boolvv 
	IsVisiblevv 
{ww 	
getxx 
{xx 
returnxx 

_isVisiblexx #
;xx# $
}xx% &
setyy 
{zz 

_isVisible{{ 
={{ 
value{{ "
;{{" #!
NotifyPropertyChanged|| %
(||% &
$str||& 1
)||1 2
;||2 3
}}} 
}~~ 	
public
�� 
bool
�� 
IsRevealPassword
�� $
{
�� 	
get
�� 
{
�� 
return
�� 
_isRevealPassword
�� *
;
��* +
}
��, -
set
�� 
{
�� 
_isRevealPassword
�� !
=
��" #
value
��$ )
;
��) *#
NotifyPropertyChanged
�� %
(
��% &
$str
��& 8
)
��8 9
;
��9 :
}
�� 
}
�� 	
public
�� 
bool
�� 
HasExpirationDate
�� %
{
�� 	
get
�� 
{
�� 
return
�� 
_pwEntry
�� !
.
��! "
Expires
��" )
;
��) *
}
��+ ,
set
�� 
{
�� 
_pwEntry
�� 
.
�� 
Expires
��  
=
��! "
value
��# (
;
��( )#
NotifyPropertyChanged
�� %
(
��% &
$str
��& 9
)
��9 :
;
��: ;
}
�� 
}
�� 	
public
�� 
IEnumerable
�� 
<
�� 
	IPwEntity
�� $
>
��$ %
History
��& -
{
�� 	
get
�� 
{
�� 
var
�� 
history
�� 
=
�� 
new
�� !
List
��" &
<
��& '
EntryVm
��' .
>
��. /
{
��0 1
this
��1 5
}
��5 6
;
��6 7
foreach
�� 
(
�� 
var
�� 
historyEntry
�� )
in
��* ,
_pwEntry
��- 5
.
��5 6
History
��6 =
)
��= >
{
�� 
history
�� 
.
�� 
Add
�� 
(
��  
new
��  #
EntryVm
��$ +
(
��+ ,
historyEntry
��, 8
,
��8 9
ParentGroup
��: E
)
��E F
{
��G H

IsSelected
��H R
=
��S T
false
��U Z
}
��Z [
)
��[ \
;
��\ ]
}
�� 
return
�� 
history
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
event
�� )
PropertyChangedEventHandler
�� 0
PropertyChanged
��1 @
;
��@ A
private
�� 
readonly
�� 
PwEntry
��  
_pwEntry
��! )
;
��) *
private
�� 
readonly
�� 
IDatabaseService
�� )
	_database
��* 3
;
��3 4
private
�� 
readonly
�� 
IResourceService
�� )
	_resource
��* 3
;
��3 4
private
�� 
bool
�� 
_isEditMode
��  
;
��  !
private
�� 
bool
�� 
_isRevealPassword
�� &
;
��& '
private
�� 
double
�� 
_passwordLength
�� &
=
��' (
$num
��) +
;
��+ ,
private
�� 
bool
�� 

_isVisible
�� 
=
��  !
true
��" &
;
��& '
private
�� 
void
�� #
NotifyPropertyChanged
�� *
(
��* +
string
��+ 1
propertyName
��2 >
)
��> ?
{
�� 	
PropertyChanged
�� 
?
�� 
.
�� 
Invoke
�� #
(
��# $
this
��$ (
,
��( )
new
��* -&
PropertyChangedEventArgs
��. F
(
��F G
propertyName
��G S
)
��S T
)
��T U
;
��U V
}
�� 	
public
�� 
EntryVm
�� 
(
�� 
)
�� 
{
�� 
}
�� 
internal
�� 
EntryVm
�� 
(
�� 
PwEntry
��  
entry
��! &
,
��& '
GroupVm
��( /
parent
��0 6
)
��6 7
:
��8 9
this
��: >
(
��> ?
entry
��? D
,
��D E
parent
��F L
,
��L M
DatabaseService
��N ]
.
��] ^
Instance
��^ f
,
��f g
new
��h k
ResourcesService
��l |
(
��| }
)
��} ~
)
��~ 
{��� �
}��� �
public
�� 
EntryVm
�� 
(
�� 
PwEntry
�� 
entry
�� $
,
��$ %
GroupVm
��& -
parent
��. 4
,
��4 5
IDatabaseService
��6 F
database
��G O
,
��O P
IResourceService
��Q a
resource
��b j
)
��j k
{
�� 	
	_database
�� 
=
�� 
database
��  
;
��  !
	_resource
�� 
=
�� 
resource
��  
;
��  !
_pwEntry
�� 
=
�� 
entry
�� 
;
�� 
ParentGroup
�� 
=
�� 
parent
��  
;
��  !
}
�� 	
public
�� 
void
�� 
GeneratePassword
�� $
(
��$ %
)
��% &
{
�� 	
var
�� 
	pwProfile
�� 
=
�� 
new
�� 
	PwProfile
��  )
{
�� 
GeneratorType
�� 
=
�� #
PasswordGeneratorType
��  5
.
��5 6
CharSet
��6 =
,
��= >
Length
�� 
=
�� 
(
�� 
uint
�� 
)
�� 
PasswordLength
�� -
,
��- .
CharSet
�� 
=
�� 
new
�� 
	PwCharSet
�� '
(
��' (
)
��( )
}
�� 
;
�� 
if
�� 
(
�� &
UpperCasePatternSelected
�� (
)
��( )
	pwProfile
��* 3
.
��3 4
CharSet
��4 ;
.
��; <
Add
��< ?
(
��? @
	PwCharSet
��@ I
.
��I J
	UpperCase
��J S
)
��S T
;
��T U
if
�� 
(
�� &
LowerCasePatternSelected
�� (
)
��( )
	pwProfile
��* 3
.
��3 4
CharSet
��4 ;
.
��; <
Add
��< ?
(
��? @
	PwCharSet
��@ I
.
��I J
	LowerCase
��J S
)
��S T
;
��T U
if
�� 
(
�� #
DigitsPatternSelected
�� %
)
��% &
	pwProfile
��' 0
.
��0 1
CharSet
��1 8
.
��8 9
Add
��9 <
(
��< =
	PwCharSet
��= F
.
��F G
Digits
��G M
)
��M N
;
��N O
if
�� 
(
�� $
SpecialPatternSelected
�� &
)
��& '
	pwProfile
��( 1
.
��1 2
CharSet
��2 9
.
��9 :
Add
��: =
(
��= >
	PwCharSet
��> G
.
��G H
SpecialChars
��H T
)
��T U
;
��U V
if
�� 
(
�� "
MinusPatternSelected
�� $
)
��$ %
	pwProfile
��& /
.
��/ 0
CharSet
��0 7
.
��7 8
Add
��8 ;
(
��; <
$char
��< ?
)
��? @
;
��@ A
if
�� 
(
�� '
UnderscorePatternSelected
�� )
)
��) *
	pwProfile
��+ 4
.
��4 5
CharSet
��5 <
.
��< =
Add
��= @
(
��@ A
$char
��A D
)
��D E
;
��E F
if
�� 
(
�� "
SpacePatternSelected
�� $
)
��$ %
	pwProfile
��& /
.
��/ 0
CharSet
��0 7
.
��7 8
Add
��8 ;
(
��; <
$char
��< ?
)
��? @
;
��@ A
if
�� 
(
�� %
BracketsPatternSelected
�� '
)
��' (
	pwProfile
��) 2
.
��2 3
CharSet
��3 :
.
��: ;
Add
��; >
(
��> ?
	PwCharSet
��? H
.
��H I
Brackets
��I Q
)
��Q R
;
��R S
	pwProfile
�� 
.
�� 
CharSet
�� 
.
�� 
Add
�� !
(
��! "
CustomChars
��" -
)
��- .
;
��. /
ProtectedString
�� 
password
�� $
;
��$ %
PwGenerator
�� 
.
�� 
Generate
��  
(
��  !
out
��! $
password
��% -
,
��- .
	pwProfile
��/ 8
,
��8 9
null
��: >
,
��> ?
new
��@ C#
CustomPwGeneratorPool
��D Y
(
��Y Z
)
��Z [
)
��[ \
;
��\ ]
_pwEntry
�� 
?
�� 
.
�� 
Strings
�� 
.
�� 
Set
�� !
(
��! "
PwDefs
��" (
.
��( )
PasswordField
��) 6
,
��6 7
password
��8 @
)
��@ A
;
��A B#
NotifyPropertyChanged
�� !
(
��! "
$str
��" ,
)
��, -
;
��- .#
NotifyPropertyChanged
�� !
(
��! "
$str
��" ;
)
��; <
;
��< =#
NotifyPropertyChanged
�� !
(
��! "
$str
��" ?
)
��? @
;
��@ A
}
�� 	
private
�� 
string
�� 
GetEntryValue
�� $
(
��$ %
string
��% +
key
��, /
)
��/ 0
{
�� 	
return
�� 
_pwEntry
�� 
?
�� 
.
�� 
Strings
�� $
.
��$ %
GetSafe
��% ,
(
��, -
key
��- 0
)
��0 1
.
��1 2

ReadString
��2 <
(
��< =
)
��= >
;
��> ?
}
�� 	
private
�� 
void
�� 
SetEntryValue
�� "
(
��" #
string
��# )
key
��* -
,
��- .
string
��/ 5
newValue
��6 >
)
��> ?
{
�� 	
_pwEntry
�� 
?
�� 
.
�� 
Strings
�� 
.
�� 
Set
�� !
(
��! "
key
��" %
,
��% &
new
��' *
ProtectedString
��+ :
(
��: ;
true
��; ?
,
��? @
newValue
��A I
)
��I J
)
��J K
;
��K L
}
�� 	
public
�� 
void
�� 
MarkForDelete
�� !
(
��! "
string
��" (
recycleBinTitle
��) 8
)
��8 9
{
�� 	
if
�� 
(
�� 
	_database
�� 
.
�� 
RecycleBinEnabled
�� +
&&
��, .
	_database
��/ 8
.
��8 9

RecycleBin
��9 C
?
��C D
.
��D E
IdUuid
��E K
==
��L N
null
��O S
)
��S T
	_database
�� 
.
�� 
CreateRecycleBin
�� *
(
��* +
recycleBinTitle
��+ :
)
��: ;
;
��; <
Move
�� 
(
�� 
	_database
�� 
.
�� 
RecycleBinEnabled
�� ,
&&
��- /
!
��0 1
ParentGroup
��1 <
.
��< =

IsSelected
��= G
?
��H I
	_database
��J S
.
��S T

RecycleBin
��T ^
:
��_ `
null
��a e
)
��e f
;
��f g
}
�� 	
public
�� 
void
�� 

UndoDelete
�� 
(
�� 
)
��  
{
�� 	
Move
�� 
(
�� 
PreviousGroup
�� 
)
�� 
;
��  
}
�� 	
public
�� 
void
�� 
Move
�� 
(
�� 
GroupVm
��  
destination
��! ,
)
��, -
{
�� 	
PreviousGroup
�� 
=
�� 
ParentGroup
�� '
;
��' (
PreviousGroup
�� 
.
�� 
Entries
�� !
.
��! "
Remove
��" (
(
��( )
this
��) -
)
��- .
;
��. /
if
�� 
(
�� 
destination
�� 
==
�� 
null
�� #
)
��# $
{
�� 
	_database
�� 
.
�� 
AddDeletedItem
�� (
(
��( )
IdUuid
��) /
)
��/ 0
;
��0 1
return
�� 
;
�� 
}
�� 
ParentGroup
�� 
=
�� 
destination
�� %
;
��% &
ParentGroup
�� 
.
�� 
Entries
�� 
.
��  
Add
��  #
(
��# $
this
��$ (
)
��( )
;
��) *
}
�� 	
public
�� 
void
�� 
CommitDelete
��  
(
��  !
)
��! "
{
�� 	
_pwEntry
�� 
.
�� 
ParentGroup
��  
.
��  !
Entries
��! (
.
��( )
Remove
��) /
(
��/ 0
_pwEntry
��0 8
)
��8 9
;
��9 :
if
�� 
(
�� 
!
�� 
	_database
�� 
.
�� 
RecycleBinEnabled
�� ,
||
��- /
PreviousGroup
��0 =
.
��= >

IsSelected
��> H
)
��H I
	_database
��J S
.
��S T
AddDeletedItem
��T b
(
��b c
IdUuid
��c i
)
��i j
;
��j k
}
�� 	
public
�� 
void
�� 
Save
�� 
(
�� 
)
�� 
{
�� 	
	_database
�� 
.
�� 
Save
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
PwEntry
�� 

GetPwEntry
�� !
(
��! "
)
��" #
{
�� 	
return
�� 
_pwEntry
�� 
;
�� 
}
�� 	
public
�� 
override
�� 
string
�� 
ToString
�� '
(
��' (
)
��( )
{
�� 	
return
�� 

IsSelected
�� 
?
�� 
	_resource
��  )
.
��) *
GetResourceValue
��* :
(
��: ;
$str
��; I
)
��I J
:
��K L
_pwEntry
��M U
.
��U V"
LastModificationTime
��V j
.
��j k
ToString
��k s
(
��s t
$str
��t w
)
��w x
;
��x y
}
�� 	
}
�� 
}�� �
BC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\GroupVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
GroupVm 
: %
NotifyPropertyChangedBase 4
,4 5
	IPwEntity6 ?
,? @
ISelectableModelA Q
{ 
public 
GroupVm 
ParentGroup "
{# $
get% (
;( )
private* 1
set2 5
;5 6
}7 8
public 
GroupVm 
PreviousGroup $
{% &
get' *
;* +
private, 3
set4 7
;7 8
}9 :
public  
ObservableCollection #
<# $
EntryVm$ +
>+ ,
Entries- 4
{ 	
get 
{ 
return 
_entries !
;! "
}# $
private 
set 
{ 
SetProperty %
(% &
ref& )
_entries* 2
,2 3
value4 9
)9 :
;: ;
}< =
} 	
public 
IEnumerable 
< 
EntryVm "
>" #

SubEntries$ .
{ 	
get 
{ 
var 

subEntries 
=  
new! $
List% )
<) *
EntryVm* 1
>1 2
(2 3
)3 4
;4 5

subEntries 
. 
AddRange #
(# $
Entries$ +
)+ ,
;, -
foreach 
( 
var 
group "
in# %
Groups& ,
), -
{ 

subEntries   
.   
AddRange   '
(  ' (
group  ( -
.  - .

SubEntries  . 8
)  8 9
;  9 :
}!! 
return## 

subEntries## !
;##! "
}$$ 
}%% 	
public''  
ObservableCollection'' #
<''# $
GroupVm''$ +
>''+ ,
Groups''- 3
{''4 5
get''6 9
;''9 :
set''; >
;''> ?
}''@ A
=''B C
new''D G 
ObservableCollection''H \
<''\ ]
GroupVm''] d
>''d e
(''e f
)''f g
;''g h
public)) 
PwUuid)) 
IdUuid)) 
=>)) 
_pwGroup))  (
?))( )
.))) *
Uuid))* .
;)). /
public** 
string** 
Id** 
=>** 
IdUuid** "
?**" #
.**# $
ToHexString**$ /
(**/ 0
)**0 1
;**1 2
public++ 
bool++ 
	IsNotRoot++ 
=>++  
ParentGroup++! ,
!=++- /
null++0 4
;++4 5
public-- 
bool-- 
ShowRestore-- 
=>--  "
	IsNotRoot--# ,
&&--- /
ParentGroup--0 ;
.--; <

IsSelected--< F
;--F G
public// 
bool// 
IsRecycleOnDelete// %
=>//& (
	_database//) 2
.//2 3
RecycleBinEnabled//3 D
&&//E G
!//H I

IsSelected//I S
&&//T V
!//W X
ParentGroup//X c
.//c d

IsSelected//d n
;//n o
public44 
bool44 

IsSelected44 
{55 	
get66 
{66 
return66 
	_database66 "
!=66# %
null66& *
&&66+ -
	_database66. 7
.667 8
RecycleBinEnabled668 I
&&66J L
	_database66M V
.66V W

RecycleBin66W a
?66a b
.66b c
Id66c e
==66f h
Id66i k
;66k l
}66m n
set77 
{88 
if99 
(99 
value99 
&&99 
_pwGroup99 %
!=99& (
null99) -
)99- .
	_database99/ 8
.998 9

RecycleBin999 C
=99D E
this99F J
;99J K
}:: 
};; 	
public== 
IOrderedEnumerable== !
<==! "
	IGrouping==" +
<==+ ,
char==, 0
,==0 1
EntryVm==2 9
>==9 :
>==: ;
EntriesZoomedOut==< L
=>==M O
from==P T
e==U V
in==W Y
Entries==Z a
group>> 
e>> 
by>> 
e>> 
.>> 
Name>> 
.>> 
ToUpper>> %
(>>% &
)>>& '
.>>' (
FirstOrDefault>>( 6
(>>6 7
)>>7 8
into>>9 =
grp>>> A
orderby?? 
grp?? 
.?? 
Key?? 
select@@ 
grp@@ 
;@@ 
publicBB 
stringBB 
NameBB 
{CC 	
getDD 
{DD 
returnDD 
_pwGroupDD !
==DD" $
nullDD% )
?DD* +
stringDD, 2
.DD2 3
EmptyDD3 8
:DD9 :
_pwGroupDD; C
.DDC D
NameDDD H
;DDH I
}DDJ K
setEE 
{EE 
_pwGroupEE 
.EE 
NameEE 
=EE  !
valueEE" '
;EE' (
}EE) *
}FF 	
publicHH 
intHH 
IconIdHH 
{II 	
getJJ 
{KK 
ifLL 
(LL 
_pwGroupLL 
?LL 
.LL 
IconIdLL $
!=LL% '
nullLL( ,
)LL, -
returnLL. 4
(LL5 6
intLL6 9
)LL9 :
_pwGroupLL; C
?LLC D
.LLD E
IconIdLLE K
;LLK L
returnMM 
-MM 
$numMM 
;MM 
}NN 
setOO 
{OO 
_pwGroupOO 
.OO 
IconIdOO !
=OO" #
(OO$ %
PwIconOO% +
)OO+ ,
valueOO, 1
;OO1 2
}OO3 4
}PP 	
publicRR 
boolRR 

IsEditModeRR 
{SS 	
getTT 
{TT 
returnTT 
_isEditModeTT $
;TT$ %
}TT& '
setUU 
{UU 
SetPropertyUU 
(UU 
refUU !
_isEditModeUU" -
,UU- .
valueUU/ 4
)UU4 5
;UU5 6
}UU7 8
}VV 	
publicXX 
boolXX 
IsMenuClosedXX  
{YY 	
getZZ 
{ZZ 
returnZZ 
_isMenuClosedZZ &
;ZZ& '
}ZZ( )
set[[ 
{[[ 
SetProperty[[ 
([[ 
ref[[ !
_isMenuClosed[[" /
,[[/ 0
value[[1 6
)[[6 7
;[[7 8
}[[9 :
}\\ 	
public^^ 
IEnumerable^^ 
<^^ 
	IPwEntity^^ $
>^^$ %

BreadCrumb^^& 0
{__ 	
get`` 
{aa 
varbb 
groupsbb 
=bb 
newbb  
Stackbb! &
<bb& '
GroupVmbb' .
>bb. /
(bb/ 0
)bb0 1
;bb1 2
varcc 
groupcc 
=cc 
thiscc  
;cc  !
whiledd 
(dd 
groupdd 
.dd 
ParentGroupdd (
!=dd) +
nulldd, 0
)dd0 1
{ee 
groupff 
=ff 
groupff !
.ff! "
ParentGroupff" -
;ff- .
groupsgg 
.gg 
Pushgg 
(gg  
groupgg  %
)gg% &
;gg& '
}hh 
returnjj 
groupsjj 
;jj 
}kk 
}ll 	
privatenn 
readonlynn 
PwGroupnn  
_pwGroupnn! )
;nn) *
privateoo 
readonlyoo 
IDatabaseServiceoo )
	_databaseoo* 3
;oo3 4
privatepp 
boolpp 
_isEditModepp  
;pp  !
privateqq 
PwEntryqq 
_reorderedEntryqq '
;qq' (
privaterr  
ObservableCollectionrr $
<rr$ %
EntryVmrr% ,
>rr, -
_entriesrr. 6
=rr7 8
newrr9 < 
ObservableCollectionrr= Q
<rrQ R
EntryVmrrR Y
>rrY Z
(rrZ [
)rr[ \
;rr\ ]
privatess 
boolss 
_isMenuClosedss "
=ss# $
truess% )
;ss) *
publicuu 
GroupVmuu 
(uu 
)uu 
{uu 
}uu 
internalww 
GroupVmww 
(ww 
PwGroupww  
pwGroupww! (
,ww( )
GroupVmww* 1
parentww2 8
,ww8 9
PwUuidww: @
recycleBinIdwwA M
=wwN O
nullwwP T
)wwT U
:wwV W
thiswwX \
(ww\ ]
pwGroupww] d
,wwd e
parentwwf l
,wwl m
DatabaseServicexx 
.xx 
Instancexx $
,xx$ %
recycleBinIdxx& 2
)xx2 3
{yy 	
}yy
 
public{{ 
GroupVm{{ 
({{ 
PwGroup{{ 
pwGroup{{ &
,{{& '
GroupVm{{( /
parent{{0 6
,{{6 7
IDatabaseService{{8 H
database{{I Q
,{{Q R
PwUuid{{S Y
recycleBinId{{Z f
={{g h
null{{i m
){{m n
{|| 	
_pwGroup}} 
=}} 
pwGroup}} 
;}} 
	_database~~ 
=~~ 
database~~  
;~~  !
ParentGroup 
= 
parent  
;  !
if
�� 
(
�� 
recycleBinId
�� 
!=
�� 
null
��  $
&&
��% '
_pwGroup
��( 0
.
��0 1
Uuid
��1 5
.
��5 6
Equals
��6 <
(
��< =
recycleBinId
��= I
)
��I J
)
��J K
	_database
��L U
.
��U V

RecycleBin
��V `
=
��a b
this
��c g
;
��g h
Entries
�� 
=
�� 
new
�� "
ObservableCollection
�� .
<
��. /
EntryVm
��/ 6
>
��6 7
(
��7 8
pwGroup
��8 ?
.
��? @
Entries
��@ G
.
��G H
Select
��H N
(
��N O
e
��O P
=>
��Q S
new
��T W
EntryVm
��X _
(
��_ `
e
��` a
,
��a b
this
��c g
)
��g h
)
��h i
)
��i j
;
��j k
Entries
�� 
.
�� 
CollectionChanged
�� %
+=
��& ('
Entries_CollectionChanged
��) B
;
��B C
Groups
�� 
=
�� 
new
�� "
ObservableCollection
�� -
<
��- .
GroupVm
��. 5
>
��5 6
(
��6 7
pwGroup
��7 >
.
��> ?
Groups
��? E
.
��E F
Select
��F L
(
��L M
g
��M N
=>
��O Q
new
��R U
GroupVm
��V ]
(
��] ^
g
��^ _
,
��_ `
this
��a e
,
��e f
recycleBinId
��g s
)
��s t
)
��t u
)
��u v
;
��v w
}
�� 	
private
�� 
void
�� '
Entries_CollectionChanged
�� .
(
��. /
object
��/ 5
sender
��6 <
,
��< =.
 NotifyCollectionChangedEventArgs
��> ^
e
��_ `
)
��` a
{
�� 	
switch
�� 
(
�� 
e
�� 
.
�� 
Action
�� 
)
�� 
{
�� 
case
�� +
NotifyCollectionChangedAction
�� 2
.
��2 3
Remove
��3 9
:
��9 :
var
�� 
oldIndex
��  
=
��! "
(
��# $
uint
��$ (
)
��( )
e
��* +
.
��+ ,
OldStartingIndex
��, <
;
��< =
_reorderedEntry
�� $
=
��% &
_pwGroup
��' /
.
��/ 0
Entries
��0 7
.
��7 8
GetAt
��8 =
(
��= >
oldIndex
��> F
)
��F G
;
��G H
_pwGroup
�� 
.
�� 
Entries
�� $
.
��$ %
RemoveAt
��% -
(
��- .
oldIndex
��. 6
)
��6 7
;
��7 8
break
�� 
;
�� 
case
�� +
NotifyCollectionChangedAction
�� 2
.
��2 3
Add
��3 6
:
��6 7
if
�� 
(
�� 
_reorderedEntry
�� '
==
��( *
null
��+ /
)
��/ 0
_pwGroup
��1 9
.
��9 :
AddEntry
��: B
(
��B C
(
��C D
(
��D E
EntryVm
��E L
)
��L M
e
��N O
.
��O P
NewItems
��P X
[
��X Y
$num
��Y Z
]
��Z [
)
��[ \
.
��\ ]

GetPwEntry
��] g
(
��g h
)
��h i
,
��i j
true
��k o
)
��o p
;
��p q
else
�� 
_pwGroup
�� !
.
��! "
Entries
��" )
.
��) *
Insert
��* 0
(
��0 1
(
��1 2
uint
��2 6
)
��6 7
e
��7 8
.
��8 9
NewStartingIndex
��9 I
,
��I J
_reorderedEntry
��K Z
)
��Z [
;
��[ \
break
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
GroupVm
�� 
AddNewGroup
�� "
(
��" #
string
��# )
name
��* .
=
��/ 0
$str
��1 3
)
��3 4
{
�� 	
var
�� 
pwGroup
�� 
=
�� 
new
�� 
PwGroup
�� %
(
��% &
true
��& *
,
��* +
true
��, 0
,
��0 1
name
��2 6
,
��6 7
PwIcon
��8 >
.
��> ?
Folder
��? E
)
��E F
;
��F G
_pwGroup
�� 
.
�� 
AddGroup
�� 
(
�� 
pwGroup
�� %
,
��% &
true
��' +
)
��+ ,
;
��, -
var
�� 
newGroup
�� 
=
�� 
new
�� 
GroupVm
�� &
(
��& '
pwGroup
��' .
,
��. /
this
��0 4
)
��4 5
{
��6 7
Name
��7 ;
=
��< =
name
��> B
,
��B C

IsEditMode
��D N
=
��O P
string
��Q W
.
��W X
IsNullOrEmpty
��X e
(
��e f
name
��f j
)
��j k
}
��k l
;
��l m
Groups
�� 
.
�� 
Add
�� 
(
�� 
newGroup
�� 
)
��  
;
��  !
return
�� 
newGroup
�� 
;
�� 
}
�� 	
public
�� 
EntryVm
�� 
AddNewEntry
�� "
(
��" #
)
��# $
{
�� 	
var
�� 
pwEntry
�� 
=
�� 
new
�� 
PwEntry
�� %
(
��% &
true
��& *
,
��* +
true
��, 0
)
��0 1
;
��1 2
var
�� 
newEntry
�� 
=
�� 
new
�� 
EntryVm
�� &
(
��& '
pwEntry
��' .
,
��. /
this
��0 4
)
��4 5
{
��6 7

IsEditMode
��7 A
=
��B C
true
��D H
}
��H I
;
��I J
newEntry
�� 
.
�� 
GeneratePassword
�� %
(
��% &
)
��& '
;
��' (
Entries
�� 
.
�� 
Add
�� 
(
�� 
newEntry
��  
)
��  !
;
��! "
return
�� 
newEntry
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
MarkForDelete
�� !
(
��! "
string
��" (
recycleBinTitle
��) 8
)
��8 9
{
�� 	
if
�� 
(
�� 
	_database
�� 
.
�� 
RecycleBinEnabled
�� +
&&
��, .
	_database
��/ 8
.
��8 9

RecycleBin
��9 C
?
��C D
.
��D E
IdUuid
��E K
==
��L N
null
��O S
)
��S T
	_database
�� 
.
�� 
CreateRecycleBin
�� *
(
��* +
recycleBinTitle
��+ :
)
��: ;
;
��; <
Move
�� 
(
�� 
	_database
�� 
.
�� 
RecycleBinEnabled
�� ,
&&
��- /
!
��0 1

IsSelected
��1 ;
?
��< =
	_database
��> G
.
��G H

RecycleBin
��H R
:
��S T
null
��U Y
)
��Y Z
;
��Z [
}
�� 	
public
�� 
void
�� 

UndoDelete
�� 
(
�� 
)
��  
{
�� 	
Move
�� 
(
�� 
PreviousGroup
�� 
)
�� 
;
��  
}
�� 	
public
�� 
void
�� 
Move
�� 
(
�� 
GroupVm
��  
destination
��! ,
)
��, -
{
�� 	
PreviousGroup
�� 
=
�� 
ParentGroup
�� '
;
��' (
PreviousGroup
�� 
.
�� 
Groups
��  
.
��  !
Remove
��! '
(
��' (
this
��( ,
)
��, -
;
��- .
PreviousGroup
�� 
.
�� 
_pwGroup
�� "
.
��" #
Groups
��# )
.
��) *
Remove
��* 0
(
��0 1
_pwGroup
��1 9
)
��9 :
;
��: ;
if
�� 
(
�� 
destination
�� 
==
�� 
null
�� #
)
��# $
{
�� 
	_database
�� 
.
�� 
AddDeletedItem
�� (
(
��( )
IdUuid
��) /
)
��/ 0
;
��0 1
return
�� 
;
�� 
}
�� 
ParentGroup
�� 
=
�� 
destination
�� %
;
��% &
ParentGroup
�� 
.
�� 
Groups
�� 
.
�� 
Add
�� "
(
��" #
this
��# '
)
��' (
;
��( )
ParentGroup
�� 
.
�� 
_pwGroup
��  
.
��  !
AddGroup
��! )
(
��) *
_pwGroup
��* 2
,
��2 3
true
��4 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
void
�� 
CommitDelete
��  
(
��  !
)
��! "
{
�� 	
_pwGroup
�� 
.
�� 
ParentGroup
��  
.
��  !
Groups
��! '
.
��' (
Remove
��( .
(
��. /
_pwGroup
��/ 7
)
��7 8
;
��8 9
if
�� 
(
�� 
	_database
�� 
.
�� 
RecycleBinEnabled
�� +
&&
��, .
!
��/ 0
PreviousGroup
��0 =
.
��= >

IsSelected
��> H
)
��H I
	_database
��J S
.
��S T

RecycleBin
��T ^
.
��^ _
_pwGroup
��_ g
.
��g h
AddGroup
��h p
(
��p q
_pwGroup
��q y
,
��y z
true
��{ 
)�� �
;��� �
else
�� 
	_database
�� 
.
�� 
AddDeletedItem
�� )
(
��) *
IdUuid
��* 0
)
��0 1
;
��1 2
}
�� 	
public
�� 
void
�� 
Save
�� 
(
�� 
)
�� 
{
�� 	
	_database
�� 
.
�� 
Save
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
SortEntries
�� 
(
��  
)
��  !
{
�� 	
var
�� 
comparer
�� 
=
�� 
new
�� 
PwEntryComparer
�� .
(
��. /
PwDefs
��/ 5
.
��5 6

TitleField
��6 @
,
��@ A
true
��B F
,
��F G
false
��H M
)
��M N
;
��N O
try
�� 
{
�� 
_pwGroup
�� 
.
�� 
Entries
��  
.
��  !
Sort
��! %
(
��% &
comparer
��& .
)
��. /
;
��/ 0
Entries
�� 
=
�� 
new
�� "
ObservableCollection
�� 2
<
��2 3
EntryVm
��3 :
>
��: ;
(
��; <
Entries
��< C
.
��C D
OrderBy
��D K
(
��K L
e
��L M
=>
��N P
e
��Q R
.
��R S
Name
��S W
)
��W X
)
��X Y
;
��Y Z
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� !
MessageDialogHelper
�� #
.
��# $
ShowErrorDialog
��$ 3
(
��3 4
e
��4 5
)
��5 6
;
��6 7
}
�� 
}
�� 	
public
�� 
void
�� 

SortGroups
�� 
(
�� 
)
��  
{
�� 	
try
�� 
{
�� 
_pwGroup
�� 
.
�� 
SortSubGroups
�� &
(
��& '
false
��' ,
)
��, -
;
��- .
Groups
�� 
=
�� 
new
�� "
ObservableCollection
�� 1
<
��1 2
GroupVm
��2 9
>
��9 :
(
��: ;
Groups
��; A
.
��A B
OrderBy
��B I
(
��I J
g
��J K
=>
��L N
g
��O P
.
��P Q
Name
��Q U
)
��U V
.
��V W
ThenBy
��W ]
(
��] ^
g
��^ _
=>
��` b
g
��c d
.
��d e
_pwGroup
��e m
==
��n p
null
��q u
)
��u v
)
��v w
;
��w x
OnPropertyChanged
�� !
(
��! "
$str
��" *
)
��* +
;
��+ ,
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� !
MessageDialogHelper
�� #
.
��# $
ShowErrorDialog
��$ 3
(
��3 4
e
��4 5
)
��5 6
;
��6 7
}
�� 
}
�� 	
public
�� 
override
�� 
string
�� 
ToString
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
Name
�� 
;
�� 
}
�� 	
}
�� 
}�� �
NC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\Items\SettingsNewVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
SettingsNewVm 
{ 
private		 
readonly		 
ISettingsService		 )
	_settings		* 3
;		3 4
public 
SettingsNewVm 
( 
) 
:  
this! %
(% &
SettingsService& 5
.5 6
Instance6 >
)> ?
{ 	
}
 
public 
SettingsNewVm 
( 
ISettingsService -
settings. 6
)6 7
{ 	
	_settings 
= 
settings  
;  !
} 	
public 
bool 
IsCreateSample "
{ 	
get 
{ 
return 
	_settings "
." #

GetSetting# -
<- .
bool. 2
>2 3
(3 4
$str4 <
)< =
;= >
}? @
set 
{ 
	_settings 
. 

PutSetting &
(& '
$str' /
,/ 0
value1 6
)6 7
;7 8
}9 :
} 	
public 
IEnumerable 
< 
string !
>! "
FileFormats# .
=>/ 1
new2 5
[6 7
]7 8
{8 9
$str9 <
,< =
$str> A
}A B
;B C
public 
string 
FileFormatVersion '
{ 	
get 
{ 
return 
	_settings "
." #

GetSetting# -
<- .
string. 4
>4 5
(5 6
$str6 I
)I J
;J K
}L M
set 
{ 
	_settings 
. 

PutSetting &
(& '
$str' :
,: ;
value< A
)A B
;B C
}D E
} 	
}   
}!! �3
EC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\SettingsVm.cs
	namespace		 	
ModernKeePass		
 
.		 

ViewModels		 "
{

 
public 

class 

SettingsVm 
: %
NotifyPropertyChangedBase 7
,7 8 
IHasSelectableObject9 M
{ 
private 
ListMenuItemVm 
_selectedItem ,
;, -
private 
IOrderedEnumerable "
<" #
	IGrouping# ,
<, -
string- 3
,3 4
ListMenuItemVm5 C
>C D
>D E

_menuItemsF P
;P Q
public 
IOrderedEnumerable !
<! "
	IGrouping" +
<+ ,
string, 2
,2 3
ListMenuItemVm4 B
>B C
>C D
	MenuItemsE N
{ 	
get 
{ 
return 

_menuItems #
;# $
}% &
set 
{ 
SetProperty 
( 
ref !

_menuItems" ,
,, -
value. 3
)3 4
;4 5
}6 7
} 	
public 
ISelectableModel 
SelectedItem  ,
{ 	
get 
{ 
return 
_selectedItem &
;& '
}( )
set 
{ 
if 
( 
_selectedItem !
==" $
value% *
)* +
return, 2
;2 3
if 
( 
_selectedItem !
!=" $
null% )
)) *
{ 
_selectedItem !
.! "

IsSelected" ,
=- .
false/ 4
;4 5
}   
SetProperty"" 
("" 
ref"" 
_selectedItem""  -
,""- .
(""/ 0
ListMenuItemVm""0 >
)""> ?
value""? D
)""D E
;""E F
if$$ 
($$ 
_selectedItem$$ !
!=$$" $
null$$% )
)$$) *
{%% 
_selectedItem&& !
.&&! "

IsSelected&&" ,
=&&- .
true&&/ 3
;&&3 4
}'' 
}(( 
})) 	
public++ 

SettingsVm++ 
(++ 
)++ 
:++ 
this++ "
(++" #
DatabaseService++# 2
.++2 3
Instance++3 ;
,++; <
new++= @
ResourcesService++A Q
(++Q R
)++R S
)++S T
{++U V
}++W X
public-- 

SettingsVm-- 
(-- 
IDatabaseService-- *
database--+ 3
,--3 4
IResourceService--5 E
resource--F N
)--N O
{.. 	
var// 
	menuItems// 
=// 
new//  
ObservableCollection//  4
<//4 5
ListMenuItemVm//5 C
>//C D
{00 
new11 
ListMenuItemVm11 "
{22 
Title33 
=33 
resource33 $
.33$ %
GetResourceValue33% 5
(335 6
$str336 K
)33K L
,33L M
Group44 
=44 
resource44 $
.44$ %
GetResourceValue44% 5
(445 6
$str446 T
)44T U
,44U V

SymbolIcon55 
=55  
Symbol55! '
.55' (
Add55( +
,55+ ,
PageType66 
=66 
typeof66 %
(66% &#
SettingsNewDatabasePage66& =
)66= >
,66> ?

IsSelected77 
=77  
true77! %
}88 
,88 
new99 
ListMenuItemVm99 "
{:: 
Title;; 
=;; 
resource;; $
.;;$ %
GetResourceValue;;% 5
(;;5 6
$str;;6 L
);;L M
,;;M N
Group<< 
=<< 
resource<< $
.<<$ %
GetResourceValue<<% 5
(<<5 6
$str<<6 T
)<<T U
,<<U V

SymbolIcon== 
===  
Symbol==! '
.==' (
Save==( ,
,==, -
PageType>> 
=>> 
typeof>> %
(>>% &
SettingsSavePage>>& 6
)>>6 7
}?? 
,?? 
new@@ 
ListMenuItemVm@@ "
{AA 
TitleBB 
=BB 
resourceBB $
.BB$ %
GetResourceValueBB% 5
(BB5 6
$strBB6 O
)BBO P
,BBP Q
GroupCC 
=CC 
resourceCC $
.CC$ %
GetResourceValueCC% 5
(CC5 6
$strCC6 Q
)CCQ R
,CCR S

SymbolIconDD 
=DD  
SymbolDD! '
.DD' (
SettingDD( /
,DD/ 0
PageTypeEE 
=EE 
typeofEE %
(EE% & 
SettingsDatabasePageEE& :
)EE: ;
,EE; <
	IsEnabledFF 
=FF 
databaseFF  (
.FF( )
IsOpenFF) /
}GG 
,GG 
newHH 
ListMenuItemVmHH "
{II 
TitleJJ 
=JJ 
resourceJJ $
.JJ$ %
GetResourceValueJJ% 5
(JJ5 6
$strJJ6 P
)JJP Q
,JJQ R
GroupKK 
=KK 
resourceKK $
.KK$ %
GetResourceValueKK% 5
(KK5 6
$strKK6 Q
)KKQ R
,KKR S

SymbolIconLL 
=LL  
SymbolLL! '
.LL' (
PermissionsLL( 3
,LL3 4
PageTypeMM 
=MM 
typeofMM %
(MM% & 
SettingsSecurityPageMM& :
)MM: ;
,MM; <
	IsEnabledNN 
=NN 
databaseNN  (
.NN( )
IsOpenNN) /
}OO 
}PP 
;PP 
SelectedItemQQ 
=QQ 
	menuItemsQQ $
.QQ$ %
FirstOrDefaultQQ% 3
(QQ3 4
mQQ4 5
=>QQ6 8
mQQ9 :
.QQ: ;

IsSelectedQQ; E
)QQE F
;QQF G
	MenuItemsSS 
=SS 
fromSS 
itemSS !
inSS" $
	menuItemsSS% .
groupSS/ 4
itemSS5 9
bySS: <
itemSS= A
.SSA B
GroupSSB G
intoSSH L
grpSSM P
orderbySSQ X
grpSSY \
.SS\ ]
KeySS] `
selectSSa g
grpSSh k
;SSk l
}TT 	
}UU 
}VV �U
AC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\MainVm.cs
	namespace

 	
ModernKeePass


 
.

 

ViewModels

 "
{ 
public 

class 
MainVm 
: %
NotifyPropertyChangedBase 3
,3 4 
IHasSelectableObject5 I
{ 
private 
IOrderedEnumerable "
<" #
	IGrouping# ,
<, -
string- 3
,3 4
MainMenuItemVm5 C
>C D
>D E
_mainMenuItemsF T
;T U
private 
MainMenuItemVm 
_selectedItem ,
;, -
public 
string 
Name 
{ 
get  
;  !
}" #
=$ %
Package& -
.- .
Current. 5
.5 6
DisplayName6 A
;A B
public 
IOrderedEnumerable !
<! "
	IGrouping" +
<+ ,
string, 2
,2 3
MainMenuItemVm4 B
>B C
>C D
MainMenuItemsE R
{ 	
get 
{ 
return 
_mainMenuItems '
;' (
}) *
set 
{ 
SetProperty 
( 
ref !
_mainMenuItems" 0
,0 1
value2 7
)7 8
;8 9
}: ;
} 	
public 
ISelectableModel 
SelectedItem  ,
{ 	
get 
{ 
return 
_selectedItem &
;& '
}( )
set 
{ 
if 
( 
_selectedItem !
==" $
value% *
)* +
return, 2
;2 3
if 
( 
_selectedItem !
!=" $
null% )
)) *
{   
_selectedItem!! !
.!!! "

IsSelected!!" ,
=!!- .
false!!/ 4
;!!4 5
}"" 
SetProperty$$ 
($$ 
ref$$ 
_selectedItem$$  -
,$$- .
($$/ 0
MainMenuItemVm$$0 >
)$$> ?
value$$? D
)$$D E
;$$E F
if&& 
(&& 
_selectedItem&& !
!=&&" $
null&&% )
)&&) *
{'' 
_selectedItem(( !
.((! "

IsSelected((" ,
=((- .
true((/ 3
;((3 4
})) 
}** 
}++ 	
public-- 
MainVm-- 
(-- 
)-- 
{-- 
}-- 
internal// 
MainVm// 
(// 
Frame// 
referenceFrame// ,
,//, -
Frame//. 3
destinationFrame//4 D
)//D E
://F G
this//H L
(//L M
referenceFrame//M [
,//[ \
destinationFrame//] m
,//m n
DatabaseService00 
.00 
Instance00 $
,00$ %
new00& )
ResourcesService00* :
(00: ;
)00; <
,00< =
RecentService00> K
.00K L
Instance00L T
)00T U
{11 	
}11
 
public33 
MainVm33 
(33 
Frame33 
referenceFrame33 *
,33* +
Frame33, 1
destinationFrame332 B
,33B C
IDatabaseService33D T
database33U ]
,33] ^
IResourceService33_ o
resource33p x
,33x y
IRecentService	33z �
recent
33� �
)
33� �
{44 	
var55 
isDatabaseOpen55 
=55  
database55! )
!=55* ,
null55- 1
&&552 4
database555 =
.55= >
IsOpen55> D
;55D E
var77 
mainMenuItems77 
=77 
new77  # 
ObservableCollection77$ 8
<778 9
MainMenuItemVm779 G
>77G H
{88 
new99 
MainMenuItemVm99 "
{:: 
Title;; 
=;; 
resource;; $
.;;$ %
GetResourceValue;;% 5
(;;5 6
$str;;6 H
);;H I
,;;I J
PageType<< 
=<< 
typeof<< %
(<<% &
OpenDatabasePage<<& 6
)<<6 7
,<<7 8
Destination== 
===  !
destinationFrame==" 2
,==2 3
	Parameter>> 
=>> 
referenceFrame>>  .
,>>. /

SymbolIcon?? 
=??  
Symbol??! '
.??' (
Page2??( -
,??- .

IsSelected@@ 
=@@  
database@@! )
!=@@* ,
null@@- 1
&&@@2 4
database@@5 =
.@@= >

IsFileOpen@@> H
&&@@I K
!@@L M
database@@M U
.@@U V
IsOpen@@V \
}AA 
,AA 
newBB 
MainMenuItemVmBB "
{CC 
TitleDD 
=DD 
resourceDD $
.DD$ %
GetResourceValueDD% 5
(DD5 6
$strDD6 G
)DDG H
,DDH I
PageTypeEE 
=EE 
typeofEE %
(EE% &
NewDatabasePageEE& 5
)EE5 6
,EE6 7
DestinationFF 
=FF  !
destinationFrameFF" 2
,FF2 3
	ParameterGG 
=GG 
referenceFrameGG  .
,GG. /

SymbolIconHH 
=HH  
SymbolHH! '
.HH' (
AddHH( +
}II 
,II 
newJJ 
MainMenuItemVmJJ "
{KK 
TitleLL 
=LL 
resourceLL $
.LL$ %
GetResourceValueLL% 5
(LL5 6
$strLL6 H
)LLH I
,LLI J
PageTypeMM 
=MM 
typeofMM %
(MM% &
SaveDatabasePageMM& 6
)MM6 7
,MM7 8
DestinationNN 
=NN  !
destinationFrameNN" 2
,NN2 3
	ParameterOO 
=OO 
referenceFrameOO  .
,OO. /

SymbolIconPP 
=PP  
SymbolPP! '
.PP' (
SavePP( ,
,PP, -

IsSelectedQQ 
=QQ  
isDatabaseOpenQQ! /
,QQ/ 0
	IsEnabledRR 
=RR 
isDatabaseOpenRR  .
}SS 
,SS 
newTT 
MainMenuItemVmTT "
{UU 
TitleVV 
=VV 
resourceVV $
.VV$ %
GetResourceValueVV% 5
(VV5 6
$strVV6 J
)VVJ K
,VVK L
PageTypeWW 
=WW 
typeofWW %
(WW% &
RecentDatabasesPageWW& 9
)WW9 :
,WW: ;
DestinationXX 
=XX  !
destinationFrameXX" 2
,XX2 3
	ParameterYY 
=YY 
referenceFrameYY  .
,YY. /

SymbolIconZZ 
=ZZ  
SymbolZZ! '
.ZZ' (
CopyZZ( ,
,ZZ, -

IsSelected[[ 
=[[  
(\\ 
database\\ !
==\\" $
null\\% )
||\\* ,
database\\- 5
.\\5 6
IsClosed\\6 >
)\\> ?
&&\\@ B
recent]] 
.]] 

EntryCount]] )
>]]* +
$num]], -
,]]- .
	IsEnabled^^ 
=^^ 
recent^^  &
.^^& '

EntryCount^^' 1
>^^2 3
$num^^4 5
}__ 
,__ 
new`` 
MainMenuItemVm`` "
{aa 
Titlebb 
=bb 
resourcebb $
.bb$ %
GetResourceValuebb% 5
(bb5 6
$strbb6 L
)bbL M
,bbM N
PageTypecc 
=cc 
typeofcc %
(cc% &
SettingsPagecc& 2
)cc2 3
,cc3 4
Destinationdd 
=dd  !
referenceFramedd" 0
,dd0 1

SymbolIconee 
=ee  
Symbolee! '
.ee' (
Settingee( /
}ff 
,ff 
newgg 
MainMenuItemVmgg "
{hh 
Titleii 
=ii 
resourceii $
.ii$ %
GetResourceValueii% 5
(ii5 6
$strii6 I
)iiI J
,iiJ K
PageTypejj 
=jj 
typeofjj %
(jj% &
	AboutPagejj& /
)jj/ 0
,jj0 1
Destinationkk 
=kk  !
destinationFramekk" 2
,kk2 3

SymbolIconll 
=ll  
Symbolll! '
.ll' (
Helpll( ,
}mm 
,mm 
newnn 
MainMenuItemVmnn "
{oo 
Titlepp 
=pp 
resourcepp $
.pp$ %
GetResourceValuepp% 5
(pp5 6
$strpp6 J
)ppJ K
,ppK L
PageTypeqq 
=qq 
typeofqq %
(qq% &

DonatePageqq& 0
)qq0 1
,qq1 2
Destinationrr 
=rr  !
destinationFramerr" 2
,rr2 3

SymbolIconss 
=ss  
Symbolss! '
.ss' (
Shopss( ,
}tt 
}uu 
;uu 
SelectedItemww 
=ww 
mainMenuItemsww (
.ww( )
FirstOrDefaultww) 7
(ww7 8
mww8 9
=>ww: <
mww= >
.ww> ?

IsSelectedww? I
)wwI J
;wwJ K
ifzz 
(zz 
databasezz 
!=zz 
nullzz  
&&zz! #
databasezz$ ,
.zz, -
IsOpenzz- 3
)zz3 4
mainMenuItems{{ 
.{{ 
Add{{ !
({{! "
new{{" %
MainMenuItemVm{{& 4
{|| 
Title}} 
=}} 
database}} $
.}}$ %
Name}}% )
,}}) *
PageType~~ 
=~~ 
typeof~~ %
(~~% &
GroupDetailPage~~& 5
)~~5 6
,~~6 7
Destination 
=  !
referenceFrame" 0
,0 1
	Parameter
�� 
=
�� 
database
��  (
.
��( )
	RootGroup
��) 2
,
��2 3
Group
�� 
=
�� 
$str
�� '
,
��' (

SymbolIcon
�� 
=
��  
Symbol
��! '
.
��' (
ProtectedDocument
��( 9
}
�� 
)
�� 
;
�� 
MainMenuItems
�� 
=
�� 
from
��  
item
��! %
in
��& (
mainMenuItems
��) 6
group
��7 <
item
��= A
by
��B D
item
��E I
.
��I J
Group
��J O
into
��P T
grp
��U X
orderby
��Y `
grp
��a d
.
��d e
Key
��e h
select
��i o
grp
��p s
;
��s t
}
�� 	
}
�� 
}�� �
@C:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\NewVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
NewVm 
: 
OpenVm 
{ 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} �
AC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\OpenVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
OpenVm 
: %
NotifyPropertyChangedBase 2
{		 
public

 
bool

 
ShowPasswordBox

 #
=>

$ &
	_database

' 0
.

0 1

IsFileOpen

1 ;
;

; <
public 
string 
Name 
=> 
	_database '
?' (
.( )
Name) -
;- .
private 
readonly 
IDatabaseService )
	_database* 3
;3 4
public 
OpenVm 
( 
) 
: 
this 
( 
DatabaseService .
.. /
Instance/ 7
)7 8
{9 :
}; <
public 
OpenVm 
( 
IDatabaseService &
database' /
)/ 0
{ 	
	_database 
= 
database  
;  !
if 
( 
database 
== 
null  
||! #
!$ %
database% -
.- .

IsFileOpen. 8
)8 9
return: @
;@ A
OpenFile 
( 
database 
. 
DatabaseFile *
)* +
;+ ,
} 	
public 
void 
OpenFile 
( 
StorageFile (
file) -
)- .
{ 	
OpenFile 
( 
file 
, 
RecentService (
.( )
Instance) 1
)1 2
;2 3
} 	
public 
void 
OpenFile 
( 
StorageFile (
file) -
,- .
IRecentService/ =
recent> D
)D E
{ 	
	_database   
.   
DatabaseFile   "
=  # $
file  % )
;  ) *
OnPropertyChanged!! 
(!! 
$str!! $
)!!$ %
;!!% &
OnPropertyChanged"" 
("" 
$str"" /
)""/ 0
;""0 1
AddToRecentList## 
(## 
file##  
,##  !
recent##" (
)##( )
;##) *
}$$ 	
private&& 
void&& 
AddToRecentList&& $
(&&$ %
StorageFile&&% 0
file&&1 5
,&&5 6
IRecentService&&7 E
recent&&F L
)&&L M
{'' 	
recent(( 
.(( 
Add(( 
((( 
file(( 
,(( 
file(( !
.((! "
DisplayName((" -
)((- .
;((. /
})) 	
}** 
}++ �
CC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\RecentVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
RecentVm 
: %
NotifyPropertyChangedBase 5
,5 6 
IHasSelectableObject7 K
{		 
private

 
readonly

 
IRecentService

 '
_recent

( /
;

/ 0
private 
ISelectableModel  
_selectedItem! .
;. /
private  
ObservableCollection $
<$ %
IRecentItem% 0
>0 1
_recentItems2 >
=? @
newA D 
ObservableCollectionE Y
<Y Z
IRecentItemZ e
>e f
(f g
)g h
;h i
public  
ObservableCollection #
<# $
IRecentItem$ /
>/ 0
RecentItems1 <
{ 	
get 
{ 
return 
_recentItems %
;% &
}' (
set 
{ 
SetProperty 
( 
ref !
_recentItems" .
,. /
value0 5
)5 6
;6 7
}8 9
} 	
public 
ISelectableModel 
SelectedItem  ,
{ 	
get 
{ 
return 
_selectedItem &
;& '
}( )
set 
{ 
if 
( 
_selectedItem !
==" $
value% *
)* +
return, 2
;2 3
if 
( 
_selectedItem !
!=" $
null% )
)) *
{ 
_selectedItem !
.! "

IsSelected" ,
=- .
false/ 4
;4 5
} 
SetProperty 
( 
ref 
_selectedItem  -
,- .
value/ 4
)4 5
;5 6
if!! 
(!! 
_selectedItem!! !
==!!" $
null!!% )
)!!) *
return!!+ 1
;!!1 2
_selectedItem"" 
."" 

IsSelected"" (
="") *
true""+ /
;""/ 0
}## 
}$$ 	
public&& 
RecentVm&& 
(&& 
)&& 
:&& 
this&&  
(&&! "
RecentService&&" /
.&&/ 0
Instance&&0 8
)&&8 9
{'' 	
}''
 
public)) 
RecentVm)) 
()) 
IRecentService)) &
recent))' -
)))- .
{** 	
_recent++ 
=++ 
recent++ 
;++ 
RecentItems,, 
=,, 
_recent,, !
.,,! "
GetAllFiles,," -
(,,- .
),,. /
;,,/ 0
if-- 
(-- 
RecentItems-- 
.-- 
Count-- !
>--" #
$num--$ %
)--% &
SelectedItem.. 
=.. 
RecentItems.. *
[..* +
$num..+ ,
].., -
as... 0
RecentItemVm..1 =
;..= >
}// 	
public11 
void11 
ClearAll11 
(11 
)11 
{22 	
_recent33 
.33 
ClearAll33 
(33 
)33 
;33 
RecentItems44 
.44 
Clear44 
(44 
)44 
;44  
}55 	
}66 
}77 �
AC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\SaveVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
SaveVm 
{		 
private

 
readonly

 
IDatabaseService

 )
	_database

* 3
;

3 4
public 
SaveVm 
( 
) 
: 
this 
( 
DatabaseService .
.. /
Instance/ 7
)7 8
{9 :
}; <
public 
SaveVm 
( 
IDatabaseService &
database' /
)/ 0
{ 	
	_database 
= 
database  
;  !
} 	
public 
async 
Task 
Save 
( 
bool #
close$ )
=* +
true, 0
)0 1
{ 	
	_database 
. 
Save 
( 
) 
; 
if 
( 
close 
) 
await 
	_database 
.  
Close  %
(% &
)& '
;' (
} 	
public 
void 
Save 
( 
StorageFile $
file% )
)) *
{ 	
	_database 
. 
Save 
( 
file 
)  
;  !
} 	
} 
} �@
SC:\Sources\Other\ModernKeePass\ModernKeePass\ViewModels\Items\SettingsDatabaseVm.cs
	namespace 	
ModernKeePass
 
. 

ViewModels "
{ 
public 

class 
SettingsDatabaseVm #
:# $%
NotifyPropertyChangedBase% >
,> ? 
IHasSelectableObject@ T
{ 
private 
readonly 
IDatabaseService )
	_database* 3
;3 4
private 
GroupVm 
_selectedItem %
;% &
public 
bool 
HasRecycleBin !
{ 	
get 
{ 
return 
	_database "
." #
RecycleBinEnabled# 4
;4 5
}6 7
set 
{ 
	_database 
. 
RecycleBinEnabled +
=, -
value. 3
;3 4
OnPropertyChanged !
(! "
$str" 1
)1 2
;2 3
} 
} 	
public 
bool 
IsNewRecycleBin #
{ 	
get   
{   
return   
	_database   "
.  " #

RecycleBin  # -
==  . 0
null  1 5
;  5 6
}  7 8
set!! 
{"" 
if## 
(## 
value## 
)## 
	_database## $
.##$ %

RecycleBin##% /
=##0 1
null##2 6
;##6 7
}$$ 
}%% 	
public''  
ObservableCollection'' #
<''# $
GroupVm''$ +
>''+ ,
Groups''- 3
{''4 5
get''6 9
;''9 :
set''; >
;''> ?
}''@ A
public)) 
IEnumerable)) 
<)) 
string)) !
>))! "
Ciphers))# *
{** 	
get++ 
{,, 
for-- 
(-- 
var-- 
inx-- 
=-- 
$num--  
;--  !
inx--" %
<--& '

CipherPool--( 2
.--2 3

GlobalPool--3 =
.--= >
EngineCount--> I
;--I J
inx--K N
++--N P
)--P Q
{.. 
yield// 
return//  

CipherPool//! +
.//+ ,

GlobalPool//, 6
[//6 7
inx//7 :
]//: ;
.//; <
DisplayName//< G
;//G H
}00 
}11 
}22 	
public44 
int44 
CipherIndex44 
{55 	
get66 
{77 
for88 
(88 
var88 
inx88 
=88 
$num88  
;88  !
inx88" %
<88& '

CipherPool88( 2
.882 3

GlobalPool883 =
.88= >
EngineCount88> I
;88I J
++88K M
inx88M P
)88P Q
{99 
if:: 
(:: 

CipherPool:: "
.::" #

GlobalPool::# -
[::- .
inx::. 1
]::1 2
.::2 3

CipherUuid::3 =
.::= >
Equals::> D
(::D E
	_database::E N
.::N O

DataCipher::O Y
)::Y Z
)::Z [
return::\ b
inx::c f
;::f g
};; 
return<< 
-<< 
$num<< 
;<< 
}== 
set>> 
{>> 
	_database>> 
.>> 

DataCipher>> &
=>>' (

CipherPool>>) 3
.>>3 4

GlobalPool>>4 >
[>>> ?
value>>? D
]>>D E
.>>E F

CipherUuid>>F P
;>>P Q
}>>R S
}?? 	
publicAA 
IEnumerableAA 
<AA 
stringAA !
>AA! "
CompressionsAA# /
=>AA0 2
EnumAA3 7
.AA7 8
GetNamesAA8 @
(AA@ A
typeofAAA G
(AAG H"
PwCompressionAlgorithmAAH ^
)AA^ _
)AA_ `
.AA` a
TakeAAa e
(AAe f
(AAf g
intAAg j
)AAj k#
PwCompressionAlgorithm	AAk �
.
AA� �
Count
AA� �
)
AA� �
;
AA� �
publicCC 
stringCC 
CompressionNameCC %
{DD 	
getEE 
{EE 
returnEE 
EnumEE 
.EE 
GetNameEE %
(EE% &
typeofEE& ,
(EE, -"
PwCompressionAlgorithmEE- C
)EEC D
,EED E
	_databaseEEF O
.EEO P 
CompressionAlgorithmEEP d
)EEd e
;EEe f
}EEg h
setFF 
{FF 
	_databaseFF 
.FF  
CompressionAlgorithmFF 0
=FF1 2
(FF3 4"
PwCompressionAlgorithmFF4 J
)FFJ K
EnumFFK O
.FFO P
ParseFFP U
(FFU V
typeofFFV \
(FF\ ]"
PwCompressionAlgorithmFF] s
)FFs t
,FFt u
valueFFv {
)FF{ |
;FF| }
}FF~ 
}GG 	
publicHH 
IEnumerableHH 
<HH 
stringHH !
>HH! "
KeyDerivationsHH# 1
=>HH2 4
KdfPoolHH5 <
.HH< =
EnginesHH= D
.HHD E
SelectHHE K
(HHK L
eHHL M
=>HHN P
eHHQ R
.HHR S
NameHHS W
)HHW X
;HHX Y
publicJJ 
stringJJ 
KeyDerivationNameJJ '
{KK 	
getLL 
{LL 
returnLL 
KdfPoolLL  
.LL  !
GetLL! $
(LL$ %
	_databaseLL% .
.LL. /
KeyDerivationLL/ <
.LL< =
KdfUuidLL= D
)LLD E
.LLE F
NameLLF J
;LLJ K
}LLL M
setMM 
{MM 
	_databaseMM 
.MM 
KeyDerivationMM )
=MM* +
KdfPoolMM, 3
.MM3 4
EnginesMM4 ;
.MM; <
FirstOrDefaultMM< J
(MMJ K
eMMK L
=>MMM O
eMMP Q
.MMQ R
NameMMR V
==MMW Y
valueMMZ _
)MM_ `
?MM` a
.MMa b 
GetDefaultParametersMMb v
(MMv w
)MMw x
;MMx y
}MMz {
}NN 	
publicPP 
ISelectableModelPP 
SelectedItemPP  ,
{QQ 	
getRR 
{RR 
returnRR 
GroupsRR 
.RR  
FirstOrDefaultRR  .
(RR. /
gRR/ 0
=>RR1 3
gRR4 5
.RR5 6

IsSelectedRR6 @
)RR@ A
;RRA B
}RRC D
setSS 
{TT 
ifUU 
(UU 
_selectedItemUU !
==UU" $
valueUU% *
||UU+ -
IsNewRecycleBinUU. =
)UU= >
returnUU? E
;UUE F
ifVV 
(VV 
_selectedItemVV !
!=VV" $
nullVV% )
)VV) *
{WW 
_selectedItemXX !
.XX! "

IsSelectedXX" ,
=XX- .
falseXX/ 4
;XX4 5
}YY 
SetProperty[[ 
([[ 
ref[[ 
_selectedItem[[  -
,[[- .
([[/ 0
GroupVm[[0 7
)[[7 8
value[[8 =
)[[= >
;[[> ?
if]] 
(]] 
_selectedItem]] !
!=]]" $
null]]% )
)]]) *
{^^ 
_selectedItem__ !
.__! "

IsSelected__" ,
=__- .
true__/ 3
;__3 4
}`` 
}aa 
}bb 	
publicdd 
SettingsDatabaseVmdd !
(dd! "
)dd" #
:dd$ %
thisdd& *
(dd* +
DatabaseServicedd+ :
.dd: ;
Instancedd; C
)ddC D
{ddE F
}ddG H
publicff 
SettingsDatabaseVmff !
(ff! "
IDatabaseServiceff" 2
databaseff3 ;
)ff; <
{gg 	
	_databasehh 
=hh 
databasehh  
;hh  !
Groupsii 
=ii 
	_databaseii 
?ii 
.ii  
	RootGroupii  )
.ii) *
Groupsii* 0
;ii0 1
}jj 	
}kk 
}ll �T
`C:\Sources\Other\ModernKeePass\ModernKeePass\Views\UserControls\HamburgerMenuUserControl.xaml.cs
	namespace 	
ModernKeePass
 
. 
Views 
. 
UserControls *
{		 
public

 

sealed

 
partial

 
class

 $
HamburgerMenuUserControl

  8
{ 
public $
HamburgerMenuUserControl '
(' (
)( )
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
public 
string 
HeaderLabel !
{ 	
get 
{ 
return 
( 
string  
)  !
GetValue! )
() *
HeaderLabelProperty* =
)= >
;> ?
}@ A
set 
{ 
SetValue 
( 
HeaderLabelProperty .
,. /
value0 5
)5 6
;6 7
}8 9
} 	
public 
static 
readonly 
DependencyProperty 1
HeaderLabelProperty2 E
=F G
DependencyProperty 
. 
Register '
(' (
$str 
, 
typeof 
( 
string 
) 
, 
typeof 
( $
HamburgerMenuUserControl /
)/ 0
,0 1
new 
PropertyMetadata $
($ %
$str% -
,- .
(/ 0
o0 1
,1 2
args3 7
)7 8
=>9 ;
{< =
}> ?
)? @
)@ A
;A B
public 
string 
ButtonLabel !
{ 	
get 
{ 
return 
( 
string  
)  !
GetValue! )
() *
ButtonLabelProperty* =
)= >
;> ?
}@ A
set   
{   
SetValue   
(   
ButtonLabelProperty   .
,  . /
value  0 5
)  5 6
;  6 7
}  8 9
}!! 	
public"" 
static"" 
readonly"" 
DependencyProperty"" 1
ButtonLabelProperty""2 E
=""F G
DependencyProperty## 
.## 
Register## '
(##' (
$str$$ 
,$$ 
typeof%% 
(%% 
string%% 
)%% 
,%% 
typeof&& 
(&& $
HamburgerMenuUserControl&& /
)&&/ 0
,&&0 1
new'' 
PropertyMetadata'' $
(''$ %
$str''% -
,''- .
(''/ 0
o''0 1
,''1 2
args''3 7
)''7 8
=>''9 ;
{''< =
}''> ?
)''? @
)''@ A
;''A B
public)) 
string)) 
DisplayMemberPath)) '
{** 	
get++ 
{++ 
return++ 
(++ 
string++  
)++  !
GetValue++! )
(++) *%
DisplayMemberPathProperty++* C
)++C D
;++D E
}++F G
set,, 
{,, 
SetValue,, 
(,, %
DisplayMemberPathProperty,, 4
,,,4 5
value,,6 ;
),,; <
;,,< =
},,> ?
}-- 	
public.. 
static.. 
readonly.. 
DependencyProperty.. 1%
DisplayMemberPathProperty..2 K
=..L M
DependencyProperty// 
.// 
Register// '
(//' (
$str00 #
,00# $
typeof11 
(11 
string11 
)11 
,11 
typeof22 
(22 $
HamburgerMenuUserControl22 /
)22/ 0
,220 1
new33 
PropertyMetadata33 $
(33$ %
$str33% ,
,33, -
(33. /
o33/ 0
,330 1
args332 6
)336 7
=>338 :
{33; <
}33= >
)33> ?
)33? @
;33@ A
public55 
object55 
ResizeTarget55 "
{66 	
get77 
{77 
return77 
GetValue77 !
(77! " 
ResizeTargetProperty77" 6
)776 7
;777 8
}779 :
set88 
{88 
SetValue88 
(88  
ResizeTargetProperty88 /
,88/ 0
value881 6
)886 7
;887 8
}889 :
}99 	
public:: 
static:: 
readonly:: 
DependencyProperty:: 1 
ResizeTargetProperty::2 F
=::G H
DependencyProperty;; 
.;; 
Register;; '
(;;' (
$str<< 
,<< 
typeof== 
(== 
object== 
)== 
,== 
typeof>> 
(>> $
HamburgerMenuUserControl>> /
)>>/ 0
,>>0 1
new?? 
PropertyMetadata?? $
(??$ %
null??% )
,??) *
(??+ ,
o??, -
,??- .
args??/ 3
)??3 4
=>??5 7
{??8 9
}??: ;
)??; <
)??< =
;??= >
publicAA 

VisibilityAA 
IsButtonVisibleAA )
{BB 	
getCC 
{CC 
returnCC 
(CC 

VisibilityCC $
)CC$ %
GetValueCC% -
(CC- .#
IsButtonVisiblePropertyCC. E
)CCE F
;CCF G
}CCH I
setDD 
{DD 
SetValueDD 
(DD #
IsButtonVisiblePropertyDD 2
,DD2 3
valueDD4 9
)DD9 :
;DD: ;
}DD< =
}EE 	
publicFF 
staticFF 
readonlyFF 
DependencyPropertyFF 1#
IsButtonVisiblePropertyFF2 I
=FFJ K
DependencyPropertyGG 
.GG 
RegisterGG '
(GG' (
$strHH !
,HH! "
typeofII 
(II 

VisibilityII !
)II! "
,II" #
typeofJJ 
(JJ $
HamburgerMenuUserControlJJ /
)JJ/ 0
,JJ0 1
newKK 
PropertyMetadataKK $
(KK$ %

VisibilityKK% /
.KK/ 0
	CollapsedKK0 9
,KK9 :
(KK; <
oKK< =
,KK= >
argsKK? C
)KKC D
=>KKE G
{KKH I
}KKJ K
)KKK L
)KKL M
;KKM N
publicMM 
IEnumerableMM 
<MM 
	IPwEntityMM $
>MM$ %
ItemsSourceMM& 1
{NN 	
getOO 
{OO 
returnOO 
(OO 
IEnumerableOO %
<OO% &
	IPwEntityOO& /
>OO/ 0
)OO0 1
GetValueOO1 9
(OO9 :
ItemsSourcePropertyOO: M
)OOM N
;OON O
}OOP Q
setPP 
{PP 
SetValuePP 
(PP 
ItemsSourcePropertyPP .
,PP. /
valuePP0 5
)PP5 6
;PP6 7
}PP8 9
}QQ 	
publicSS 
staticSS 
readonlySS 
DependencyPropertySS 1
ItemsSourcePropertySS2 E
=SSF G
DependencyPropertyTT 
.TT 
RegisterTT '
(TT' (
$strUU 
,UU 
typeofVV 
(VV 
IEnumerableVV "
<VV" #
	IPwEntityVV# ,
>VV, -
)VV- .
,VV. /
typeofWW 
(WW $
HamburgerMenuUserControlWW /
)WW/ 0
,WW0 1
newXX 
PropertyMetadataXX $
(XX$ %
newXX% (
ListXX) -
<XX- .
	IPwEntityXX. 7
>XX7 8
(XX8 9
)XX9 :
,XX: ;
(XX< =
oXX= >
,XX> ?
argsXX@ D
)XXD E
=>XXF H
{XXI J
}XXK L
)XXL M
)XXM N
;XXN O
publicZZ 
objectZZ 
SelectedItemZZ "
{[[ 	
get\\ 
{\\ 
return\\ 
GetValue\\ !
(\\! " 
SelectedItemProperty\\" 6
)\\6 7
;\\7 8
}\\9 :
set]] 
{]] 
SetValue]] 
(]]  
SelectedItemProperty]] /
,]]/ 0
value]]1 6
)]]6 7
;]]7 8
}]]9 :
}^^ 	
public__ 
static__ 
readonly__ 
DependencyProperty__ 1 
SelectedItemProperty__2 F
=__G H
DependencyProperty`` 
.`` 
Register`` '
(``' (
$straa 
,aa 
typeofbb 
(bb 
objectbb 
)bb 
,bb 
typeofcc 
(cc $
HamburgerMenuUserControlcc /
)cc/ 0
,cc0 1
newdd 
PropertyMetadatadd $
(dd$ %
nulldd% )
,dd) *
(dd+ ,
odd, -
,dd- .
argsdd/ 3
)dd3 4
=>dd5 7
{dd8 9
}dd: ;
)dd; <
)dd< =
;dd= >
publicff 
eventff (
SelectionChangedEventHandlerff 1
SelectionChangedff2 B
;ffB C
publicgg 
delegategg 
voidgg (
SelectionChangedEventHandlergg 9
(gg9 :
objectgg: @
senderggA G
,ggG H%
SelectionChangedEventArgsggI b
eggc d
)ggd e
;gge f
privatehh 
voidhh '
Selector_OnSelectionChangedhh 0
(hh0 1
objecthh1 7
senderhh8 >
,hh> ?%
SelectionChangedEventArgshh@ Y
ehhZ [
)hh[ \
{ii 	
SelectionChangedjj 
?jj 
.jj 
Invokejj $
(jj$ %
senderjj% +
,jj+ ,
ejj- .
)jj. /
;jj/ 0
}kk 	
publicmm 
eventmm %
ButtonClickedEventHandlermm .
ButtonClickedmm/ <
;mm< =
publicnn 
delegatenn 
voidnn %
ButtonClickedEventHandlernn 6
(nn6 7
objectnn7 =
sendernn> D
,nnD E
RoutedEventArgsnnF U
ennV W
)nnW X
;nnX Y
privateoo 
voidoo 
ButtonBase_OnClickoo '
(oo' (
objectoo( .
senderoo/ 5
,oo5 6
RoutedEventArgsoo7 F
eooG H
)ooH I
{pp 	
ButtonClickedqq 
?qq 
.qq 
Invokeqq !
(qq! "
senderqq" (
,qq( )
eqq* +
)qq+ ,
;qq, -
}rr 	
}ss 
}tt 