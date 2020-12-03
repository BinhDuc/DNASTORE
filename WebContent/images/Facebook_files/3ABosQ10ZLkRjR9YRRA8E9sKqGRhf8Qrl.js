if (self.CavalryLogger) { CavalryLogger.start_js(["k1v4s"]); }

__d("CometGamingVideoFollowButton_page.graphql",[],(function(a,b,c,d,e,f){"use strict";a={argumentDefinitions:[],kind:"Fragment",metadata:null,name:"CometGamingVideoFollowButton_page",selections:[{alias:null,args:null,kind:"ScalarField",name:"id",storageKey:null},{alias:null,args:null,kind:"ScalarField",name:"does_viewer_follow",storageKey:null},{alias:null,args:null,kind:"ScalarField",name:"live_video_subscription_status",storageKey:null},{alias:null,args:null,kind:"ScalarField",name:"name",storageKey:null}],type:"Page",abstractKey:null};e.exports=a}),null);
__d("CometGamingFollowLifecycleStrings",["fbt"],(function(a,b,c,d,e,f,g){"use strict";a=g._("All Videos");f.NOTIF_ALL_VIDEOS=a;b=g._("Highlights");f.NOTIF_HIGHLIGHTS=b;c=g._("None");f.NOTIF_NONE=c;d=g._("Receive all video notifications from this Page.");f.NOTIF_ALL_VIDEOS_DESC=d;e=g._("Receive suggested video notifications from this Page.");f.NOTIF_HIGHLIGHTS_DESC=e;a=g._("Turn off notifications from this Page.");f.NOTIF_NONE_DESC=a;b=g._("Video Notifications");f.NOTIF_MENU_TITLE=b;c=g._("You'll stop seeing posts in your News Feed.");f.UNFOLLOW_DESC=c;d=g._("Unfollow");f.UNFOLLOW=d}),null);
__d("CometGamingVideoNotifButton.react",["ix","Actor","CometDeferredPopoverTrigger.react","CometGamingFollowLifecycleStrings","CometGamingVideoMutations","React","TetraButton.react","fbicon","requireDeferred"],(function(a,b,c,d,e,f,g){"use strict";e.exports=a;var h=b("React"),i=b("requireDeferred")("CometVideoGamingNotificationsMenu.react");function a(a){var c,d=a.buttonProps,e=a.commitUnfollowMutation,f=a.followLocation,j=a.hardFollowStatus,k=a.pageID,l=a.shouldDisable;a=a.vanity;var m=b("Actor").useActor();m=m[0];m=(c=b("CometGamingVideoMutations")).useUnfollowMutation(m,k,f);m[0];f=c.useLiveVideoSubscriptionMutation(k,!0,"ALL","UNKNOWN");m=f[0];var n=f[1];f=c.useLiveVideoSubscriptionMutation(k,!0,"SOME","UNKNOWN");var o=f[0],p=f[1];f=c.useLiveVideoSubscriptionMutation(k,!0,"OFF","UNKNOWN");c=f[0];var q=f[1],r,s;switch(j){case"ALL":r=b("fbicon")._(g("1086070"),16);s=b("CometGamingFollowLifecycleStrings").NOTIF_ALL_VIDEOS;break;case"SOME":default:r=b("fbicon")._(g("532352"),16);s=b("CometGamingFollowLifecycleStrings").NOTIF_HIGHLIGHTS;break;case"OFF":r=b("fbicon")._(g("569284"),16);s=b("CometGamingFollowLifecycleStrings").NOTIF_NONE;break}return h.jsx(b("CometDeferredPopoverTrigger.react"),{align:"start",popoverProps:{commitAllBellMutation:m,commitOffBellMutation:c,commitSomeBellMutation:o,commitUnfollowMutation:e,hardFollowStatus:j,pageID:k,vanity:a},popoverResource:i,children:function(a,c){return h.jsx(b("TetraButton.react"),babelHelpers["extends"]({disabled:l||n||p||q,icon:r,label:s,type:"secondary"},d,{onPress:function(){return c()},ref:a}))}})}}),null);
__d("GamingDestinationTypedLoggerLite",["generateLiteTypedLogger"],(function(a,b,c,d,e,f){"use strict";e.exports=b("generateLiteTypedLogger")("logger:GamingDestinationLoggerConfig")}),null);
__d("GamingVideoDestinationLoggingContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c={external_entrypoint:"unknown",surface:"unknown"};d=a.createContext(c);e.exports=d}),null);
__d("useGamingVideoDestinationEventLogger",["GamingDestinationTypedLoggerLite","GamingVideoDestinationLoggingContext","React"],(function(a,b,c,d,e,f){"use strict";e.exports=a;var g=b("React");function a(){var a=g.useContext(b("GamingVideoDestinationLoggingContext")),c=g.useCallback(function(c,d){b("GamingDestinationTypedLoggerLite").log(babelHelpers["extends"]({event:c},a,d))},[a]),d=g.useCallback(function(a){c("click",a)},[c]),e=g.useCallback(function(a){c("impression",a)},[c]);return{logClick:d,logEvent:c,logImpression:e}}}),null);
__d("CometGamingVideoFollowButton.react",["ix","fbt","Actor","CometGamingVideoMutations","CometGamingVideoNotifButton.react","CometLazyPopoverTrigger.react","CometRelay","JSResourceForInteraction","React","TetraButton.react","TetraButtonGroup.react","fbicon","gkx","recoverableViolation","useCometRouteTracePolicy","useGamingVideoDestinationEventLogger","useIsLoggedOut","CometGamingVideoFollowButton_page.graphql"],(function(a,b,c,d,e,f,g,h){"use strict";e.exports=a;var i,j=b("React"),k=b("JSResourceForInteraction")("CometGamingVideoLoggedOutPopover.react").__setRef("CometGamingVideoFollowButton.react"),l=i!==void 0?i:i=b("CometGamingVideoFollowButton_page.graphql");function a(a){var c=a.followLocation,d=a.logDestinationEvents;d=d===void 0?!0:d;var e=a.page,f=a.showBell;f=f===void 0?!1:f;a=babelHelpers.objectWithoutPropertiesLoose(a,["followLocation","logDestinationEvents","page","showBell"]);e=b("CometRelay").useFragment(l,e);var g=e.does_viewer_follow,i=e.id,k=e.live_video_subscription_status;e=e.name;g=!!g;if(i==null){b("recoverableViolation")("Cannot have null pageID for follow button","gaming_video");return null}return j.jsx(m,{buttonProps:a,followLocation:c,hardFollowStatus:k,isFollowing:g,logDestinationEvents:d,pageID:i,showBell:f,vanity:(a=e)!=null?a:h._("this page")})}function m(a){var c,d=a.buttonProps,e=a.followLocation,f=a.hardFollowStatus,i=a.isFollowing,l=a.logDestinationEvents,m=a.pageID,n=a.showBell;a=a.vanity;var o=b("useCometRouteTracePolicy")(),p=b("Actor").useActor();p=p[0];var q=b("useIsLoggedOut")(),r=(c=b("CometGamingVideoMutations")).useFollowMutation(p,m,e),s=r[0],t=r[1];r=c.useUnfollowMutation(p,m,e);var u=r[0],v=r[1];p=c.useLiveVideoSubscriptionMutation(m,i,"ALL","UNKNOWN");var w=p[0];r=p[1];p=c.useLiveVideoSubscriptionMutation(m,i,"SOME","UNKNOWN");var x=p[0];c=p[1];p=b("useGamingVideoDestinationEventLogger")();var y=p.logEvent,z=function(a){i?u():s(),l&&y(i?"unfollow_streamer":"follow_streamer",{page_id:m}),d.onPress&&d.onPress(a)};p=function(a){f==="ALL"?x():w()};if(i&&f!=null&&(o==="comet.gaming.following"||o==="comet.gaming.following.streamers")&&b("gkx")("1773988"))return j.jsx(b("CometGamingVideoNotifButton.react"),{buttonProps:d,commitUnfollowMutation:u,followLocation:e,hardFollowStatus:f,pageID:m,shouldDisable:t||v,vanity:a});if(!i||!n)return j.jsx(b("CometLazyPopoverTrigger.react"),{align:"middle",popoverProps:{vanity:a},popoverResource:k,position:"below",preloadTrigger:"button",children:function(a,c){return j.jsx(b("TetraButton.react"),babelHelpers["extends"]({disabled:t||v,icon:i?b("fbicon")._(g("602176"),16):b("fbicon")._(g("618352"),16),label:i?h._("Following"):h._("Follow"),ref:a,type:i?"secondary":"primary"},d,{onPress:function(a){q?c():z(a)}}))}});else return j.jsx(b("TetraButtonGroup.react"),{paddingHorizontal:0,paddingTop:0,primary:{disabled:t||v,icon:b("fbicon")._(g("602176"),16),label:h._("Following"),onPress:z,type:"secondary"},secondaryIcon:{disabled:r||c,icon:f===null||f==="SOME"?b("fbicon")._(g("532355"),16):f==="ALL"?b("fbicon")._(g("508240"),16):b("fbicon")._(g("569284"),16),label:"bell",onPress:p},size:"medium"})}}),null);
__d("CometVideoGamingNotificationsMenu.react",["ix","fbt","CometGamingFollowLifecycleStrings","CometMenu.react","CometMenuItem.react","CometPopover.react","React","fbicon","useGamingVideoDestinationEventLogger"],(function(a,b,c,d,e,f,g,h){"use strict";e.exports=a;var i=b("React");function j(a,c,d,e,f,g,h){return i.jsx(b("CometMenuItem.react"),{"aria-checked":a,icon:a?c:d,onClick:e,primaryText:f,role:"menuitemradio",secondaryText:g},h)}function a(a){var c=a.commitAllBellMutation,d=a.commitOffBellMutation,e=a.commitSomeBellMutation,f=a.commitUnfollowMutation,k=a.hardFollowStatus,l=a.pageID;a=a.vanity;var m=b("useGamingVideoDestinationEventLogger")(),n=m.logEvent;m=k==="ALL";var o=k==="SOME";k=k==="OFF";return i.jsx(b("CometPopover.react"),{withArrow:!0,children:i.jsxs(b("CometMenu.react"),{header:{meta:h._("Choose what notifications to receive from {page name}.",[h._param("page name",a)]),title:(a=b("CometGamingFollowLifecycleStrings")).NOTIF_MENU_TITLE},children:[j(m,(m=b("fbicon"))._(g("1086071"),20),m._(g("1086775"),20),function(a){c(),n("notif_subscription_all",{page_id:l})},a.NOTIF_ALL_VIDEOS,a.NOTIF_ALL_VIDEOS_DESC,0),j(o,m._(g("532353"),20),m._(g("532356"),20),function(a){e(),n("notif_subscription_some",{page_id:l})},a.NOTIF_HIGHLIGHTS,a.NOTIF_HIGHLIGHTS_DESC,1),j(k,m._(g("664775"),20),m._(g("652791"),20),function(a){d(),n("notif_subscription_off",{page_id:l})},a.NOTIF_NONE,a.NOTIF_NONE_DESC,2),j(!1,m._(g("578903"),20),m._(g("578906"),20),function(a){f(),n("unfollow_streamer",{page_id:l})},a.UNFOLLOW,a.UNFOLLOW_DESC,3)]})})}}),null);
__d("FeedbackReactionType",[],(function(a,b,c,d,e,f){a=Object.freeze({NONE:0,LIKE:1,LOVE:2,WOW:3,HAHA:4,YAY:5,OUCH:6,SORRY:7,ANGER:8,JACKO:9,CONFUSED:10,DOROTHY:11,TOTO:12,SELFIE:13,FLAME:14,PLANE:15,SUPPORT:16});e.exports=a}),null);
__d("XCometVideoHomeLiveControllerRouteBuilder",["jsRouteBuilder"],(function(a,b,c,d,e,f){a=b("jsRouteBuilder")("/watch/live/",Object.freeze({}),void 0);c=a;e.exports=c}),null);
__d("FollowInterventionDialogQuery$Parameters",[],(function(a,b,c,d,e,f){"use strict";a={kind:"PreloadableConcreteRequest",params:{id:"4768270173247936",metadata:{},name:"FollowInterventionDialogQuery",operationKind:"query",text:null}};e.exports=a}),null);
__d("CometGranularTimestamp.react",["fbt","CometTimestamp.react","React","formatDate","useServerTime"],(function(a,b,c,d,e,f,g){"use strict";e.exports=a;var h=b("React"),i=1e3*60*60,j=i*24;function k(a,b){return a.getFullYear()===b.getFullYear()&&a.getMonth()===b.getMonth()&&a.getDate()===b.getDate()}function a(a){var c=a.date;a=a.granularity;a=a===void 0?"none":a;var d=b("useServerTime")();if(a==="none"||a==="min")return h.jsx(b("CometTimestamp.react"),{date:c});if(a==="hour"){var e=c.valueOf()%i;e=new Date(c.valueOf()-e);return h.jsx(b("CometTimestamp.react"),{date:e})}if(a==="year")return b("formatDate")(c,"Y");if(a==="month")return d.getFullYear()===c.getFullYear()?b("formatDate")(c,"F"):b("formatDate")(c,"F Y");if(k(c,d))return g._("Today");e=new Date(d.valueOf()-j);if(k(c,e))return g._("Yesterday");a=new Date(d.valueOf()+j);if(k(c,a))return g._("Tomorrow");return d.getFullYear()!==c.getFullYear()?b("formatDate")(c,"F j, Y"):b("formatDate")(c,"F j")}}),null);
__d("FollowInterventionDialog.entrypoint",["FollowInterventionDialogQuery$Parameters","JSResourceForInteraction","WebPixelRatio"],(function(a,b,c,d,e,f){"use strict";a={getPreloadProps:function(a){return{extraProps:a,queries:{FollowInterventionDialogQueryReference:{parameters:b("FollowInterventionDialogQuery$Parameters"),variables:{followType:a.followType,pageID:a.pageID,scale:b("WebPixelRatio").get()}}}}},root:b("JSResourceForInteraction")("FollowInterventionDialog.react").__setRef("FollowInterventionDialog.entrypoint")};e.exports=a}),null);
__d("ShowSurfacesLoggingUtil",["Banzai","WebSession"],(function(a,b,c,d,e,f){"use strict";f.log=a;var g="show_surfaces";function a(a,c,d,e,f,h,i,j,k){b("Banzai").post(g,{entrypoint_surface:c,event:e,event_data:f,page_id:a,player_origin:j,player_suborigin:k,session_id:b("WebSession").getId(),surface:d,video_id:h,video_list_id:i})}}),null);
__d("cometVideoHomeScrollTo",["VideoHomeTypedLoggerLite","gkx","scrollTo"],(function(a,b,c,d,e,f){"use strict";e.exports=c;function c(c,d,e){c=c.getBoundingClientRect();var f=c.height;c=c.top;e=(window.innerHeight-d-e-f)/2+d;f=e-c;d=b("gkx")("1243461");b("scrollTo")({behavior:d?"auto":"smooth",left:a.pageXOffset,top:a.pageYOffset-f});b("VideoHomeTypedLoggerLite").log({event:"auto_scroll"})}}),null);
__d("cometVideoHomeScrollToRef",["cometVideoHomeScrollTo"],(function(a,b,c,d,e,f){"use strict";e.exports=a;function a(a,c,d){if(a==null)return;a=a.current;if(a==null)return;b("cometVideoHomeScrollTo")(a,c,d)}}),null);
__d("VideoPlayerWithAutoCenterOnUserInitiatedPlay.react",["CometViewportMarginsContext","React","VideoPlayerHooks","cometVideoHomeScrollToRef","stylex","usePrevious"],(function(a,b,c,d,e,f){"use strict";e.exports=a;var g=b("React");function a(){var a=g.useRef(null),c=b("VideoPlayerHooks").usePaused(),d=b("usePrevious")(c),e=b("VideoPlayerHooks").useLastPlayReason(),f=g.useContext(b("CometViewportMarginsContext")),h=f.bottom,i=f.top;g.useEffect(function(){d===!0&&c===!1&&e==="user_initiated"&&b("cometVideoHomeScrollToRef")(a,i,h)},[e,c,d,h,i]);return g.jsx("div",{className:"kr520xx4 j9ispegn pmk7jnqg hzruof5a n7fi1qx3 i09qtzwb",ref:a})}}),null);
__d("CometVideoHomeFeedAutoAdvanceAPIContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c=a.createContext({advance:function(){},register:function(){},unregister:function(){}});e.exports=c}),null);
__d("CometVideoHomeFeedUnitPositionContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c=a.createContext(0);e.exports=c}),null);
__d("VideoPlayerWithVideoHomeAutoAdvance.react",["CometVideoHomeFeedAutoAdvanceAPIContext","CometVideoHomeFeedUnitPositionContext","React","VideoPlayerHooks"],(function(a,b,c,d,e,f){"use strict";e.exports=a;var g=b("React");function a(){var a=b("VideoPlayerHooks").useController(),c=g.useContext(b("CometVideoHomeFeedAutoAdvanceAPIContext")),d=g.useContext(b("CometVideoHomeFeedUnitPositionContext")),e=b("VideoPlayerHooks").useVideoPlayerCurrentLoop(),f=b("VideoPlayerHooks").useVideoPlayerTotalLoops(),h=g.useRef(a.getCurrentState().ended);g.useEffect(function(){var b=a.subscribe(function(){var b=a.getCurrentState();b=b.ended;!h.current&&b&&e>=f&&c.advance(d);h.current=b});return function(){b.remove()}},[c,a,e,d,f]);return null}}),null);
__d("VideoHomeGlobalSoundContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c=a.createContext({muted:!0,setMuted:function(){},setVolume:function(){},volume:1});e.exports=c}),null);
__d("VideoPlayerWithVideoHomeGlobalSoundContext.react",["React","VideoHomeGlobalSoundContext","VideoPlayerHooks","gkx","usePrevious"],(function(a,b,c,d,e,f){"use strict";e.exports=a;var g=b("React");function a(){var a,c=g.useContext(b("VideoHomeGlobalSoundContext")),d=(a=b("VideoPlayerHooks")).useController(),e=a.useMuted(),f=a.useVolume(),h=a.usePaused(),i=b("usePrevious")(e),j=b("usePrevious")(f);g.useEffect(function(){b("gkx")("1657807")||i!==null&&i!==e&&c.setMuted(e),j!==null&&j!==f&&c.setVolume(f)},[e,i,j,c,f]);g.useEffect(function(){h||(b("gkx")("1657807")||d.setMuted(c.muted,"user_initiated"),d.setVolume(c.volume))},[d,h,c.muted,c.volume]);return null}}),null);
__d("VideoHomeCometErrorBoundary.react",["CometErrorBoundary.react","React","VideoHomeTypedLoggerLite"],(function(a,b,c,d,e,f){"use strict";e.exports=a;var g=b("React");function a(a){var c=g.useCallback(function(c){b("VideoHomeTypedLoggerLite").log({event:"js_error",exception:c.message,exception_trace:c.componentStack,module_class:a.moduleClass,unit_position:a.unitPosition})},[a.moduleClass,a.unitPosition]);return g.jsx(b("CometErrorBoundary.react"),{context:{project:"www_watch"},fallback:a.fallback,onError:c,children:a.children})}}),null);
__d("CometVideoHomeThreeDotContextMenuWrapperContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c=a.createContext({contextMenuEnabled:null});e.exports=c}),null);
__d("CometVideoHomeFunnelLoggingContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c=a.createContext({hasPermalinkInjection:!1});e.exports=c}),null);
__d("CometVideoHomeRootContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c=a.createContext({autoplay:!0,injectedVideoID:null,isFacebookReferrer:!1,qplInstanceKey:0,renderedInWatchRoot:!1});e.exports=c}),null);
__d("CometVideoHomeSectionPositionContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c=a.createContext(null);e.exports=c}),null);
__d("CometVideoHomeShowSurfacesLoggingContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c=a.createContext({entrypoint:"",pageID:null,sectionTypeName:"",surface:""});e.exports=c}),null);
__d("VideoHomeLoggingExternalLogIDContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c=a.createContext(null);e.exports=c}),null);
__d("VideoHomeLoggingPermalinkShareIDContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c={permalinkShareID:null};d=a.createContext(c);e.exports=d}),null);
__d("VideoHomeLoggingUpstreamPlayerSourceContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c=a.createContext(null);e.exports=c}),null);
__d("logVideoHomeWebFunnel",["CurrentUser","WebFunnelLogger","gkx"],(function(a,b,c,d,e,f){"use strict";e.exports=a;function a(a,c,d,e){if(!b("gkx")("1238150"))return;var f=new(b("WebFunnelLogger"))("VideoHomeWWWFunnelDefinition").setAction(a).setSessionKey(b("CurrentUser").getID());c!=null&&Object.entries(c).forEach(function(a){var b=a[0];a=a[1];f.addFunnelPayload(b,a)});d!=null&&Object.entries(d).forEach(function(a){var b=a[0];a=a[1];f.addActionPayload(b,a)});e&&f.markStart();f.log()}}),null);
__d("CometVideoHomeInjectionPortalingContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c=a.createContext({initialTracePolicy:null,injectedVideoID:null,portableVideoID:null,subOrigin:null});e.exports=c}),null);
__d("ManagedError",[],(function(a,b,c,d,e,f){a=function(a){babelHelpers.inheritsLoose(b,a);function b(b,c){var d;d=a.call(this,b!==null&&b!==void 0?b:"")||this;b!==null&&b!==void 0?d.message=b:d.message="";d.innerError=c;return d}return b}(babelHelpers.wrapNativeSuper(Error));e.exports=a}),null);
__d("AssertionError",["ManagedError"],(function(a,b,c,d,e,f){a=function(a){babelHelpers.inheritsLoose(b,a);function b(b){return a.call(this,b)||this}return b}(b("ManagedError"));e.exports=a}),null);
__d("Assert",["AssertionError","sprintf"],(function(a,b,c,d,e,f){function g(a,c){if(typeof a!=="boolean"||!a)throw new(b("AssertionError"))(c);return a}function h(a,c,d){var e;if(c===void 0)e="undefined";else if(c===null)e="null";else{var f=Object.prototype.toString.call(c);e=/\s(\w*)/.exec(f)[1].toLowerCase()}g(a.indexOf(e)!==-1,d||b("sprintf")("Expression is of type %s, not %s",e,a));return c}function a(a,b,c){g(b instanceof a,c||"Expression not instance of type");return b}function i(a,b){j["is"+a]=b,j["maybe"+a]=function(a,c){a!=null&&b(a,c)}}var j={isInstanceOf:a,isTrue:g,isTruthy:function(a,b){return g(!!a,b)},type:h,define:function(a,b){a=a.substring(0,1).toUpperCase()+a.substring(1).toLowerCase(),i(a,function(a,c){g(b(a),c)})}};["Array","Boolean","Date","Function","Null","Number","Object","Regexp","String","Undefined"].forEach(function(a){i(a,h.bind(null,a.toLowerCase()))});e.exports=j}),null);