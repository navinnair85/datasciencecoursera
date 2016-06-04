define("bundles/content-feedback/components/item-feedback/ItemFeedbackContent",["require","exports","module","react-with-addons","underscore","bundles/content-feedback/actions/ItemFeedbackActions","bundles/content-feedback/constants/ItemTypes","bundles/content-feedback/models/FlagFeedback","bundles/content-feedback/models/LikeFeedback","bundles/phoenix/utils/CMLUtils","vendor/cnpm/fluxible.v0-4/addons/connectToStores","bundles/content-feedback/components/flag/Flag","bundles/content-feedback/components/like/Dislike","bundles/content-feedback/components/like/Like"],function(require,exports,module){"use strict";function _defaults(e,o){for(var i=Object.getOwnPropertyNames(o),t=0;t<i.length;t++){var n=i[t],c=Object.getOwnPropertyDescriptor(o,n);c&&c.configurable&&void 0===e[n]&&Object.defineProperty(e,n,c)}return e}function _classCallCheck(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}function _inherits(t,e){if("function"!=typeof e&&null!==e)throw new TypeError("Super expression must either be null or a function, not "+typeof e);t.prototype=Object.create(e&&e.prototype,{constructor:{value:t,enumerable:!1,writable:!0,configurable:!0}}),e&&(Object.setPrototypeOf?Object.setPrototypeOf(t,e):_defaults(t,e))}var a=Object.assign||function(c){for(var e=1;e<arguments.length;e++){var t=arguments[e];for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(c[n]=t[n])}return c},p=function(){function defineProperties(c,n){for(var t=0;t<n.length;t++){var e=n[t];e.enumerable=e.enumerable||!1,e.configurable=!0,"value"in e&&(e.writable=!0),Object.defineProperty(c,e.key,e)}}return function(e,t,n){return t&&defineProperties(e.prototype,t),n&&defineProperties(e,n),e}}(),i=function get(i,r,l){var n=!0;e:for(;n;){var t=i,s=r,a=l;n=!1,null===t&&(t=Function.prototype);var e=Object.getOwnPropertyDescriptor(t,s);if(void 0===e){var c=Object.getPrototypeOf(t);if(null===c)return void 0;i=c,r=s,l=a,n=!0,e=c=void 0;continue e}if("value"in e)return e.value;var o=e.get;if(void 0===o)return void 0;return o.call(a)}},e=require("react-with-addons"),_=require("underscore"),t=require("bundles/content-feedback/actions/ItemFeedbackActions"),s=t.getItemFeedback,o=t.likeItem,r=t.cancelLikeItem,c=t.dislikeItem,l=t.cancelDislikeItem,d=t.flagItem,u=require("bundles/content-feedback/constants/ItemTypes"),m=require("bundles/content-feedback/models/FlagFeedback"),b=require("bundles/content-feedback/models/LikeFeedback"),n=require("bundles/phoenix/utils/CMLUtils"),k=require("vendor/cnpm/fluxible.v0-4/addons/connectToStores"),f=require("bundles/content-feedback/components/flag/Flag"),I=require("bundles/content-feedback/components/like/Dislike"),h=require("bundles/content-feedback/components/like/Like"),g=function(t){function ItemFeedbackContent(){var e=this;_classCallCheck(this,ItemFeedbackContent),i(Object.getPrototypeOf(ItemFeedbackContent.prototype),"constructor",this).apply(this,arguments),this.handleLikeComment=function(c){var t=e.props,i=t.courseId,s=t.itemId,a=t.subItemId;e.context.executeAction(o,{courseId:i,itemId:s,comment:c,subItemId:a}),e.context.track("click.send_like_comment",{feedback_length:n.getLength(c)})},this.handleLikeCancel=function(){var t=e.props,n=t.courseId,c=t.itemId,o=t.subItemId,i=e.props.likeFeedback.comment;e.context.executeAction(r,{courseId:n,itemId:c,comment:i,subItemId:o}),e.context.track("click.cancel_like")},this.handleDislike=function(n){var t=e.props,o=t.courseId,i=t.itemId,s=t.subItemId;e.context.executeAction(c,{courseId:o,itemId:i,comment:n,subItemId:s}),e.context.track("click.dislike")},this.handleDislikeComment=function(o){var t=e.props,i=t.courseId,s=t.itemId,a=t.subItemId;e.context.executeAction(c,{courseId:i,itemId:s,comment:o,subItemId:a}),e.context.track("click.send_dislike_comment",{feedback_length:n.getLength(o)})},this.handleDislikeCancel=function(){var t=e.props,n=t.courseId,c=t.itemId,o=t.subItemId,i=e.props.likeFeedback.comment;e.context.executeAction(l,{courseId:n,itemId:c,comment:i,subItemId:o}),e.context.track("click.cancel_dislike")},this.handleFlag=function(){e.context.track("click.flag")},this.handleFlagSubmit=function(t){e.submitFlag(t,"click.send_flag_comments")},this.handleFlagRemove=function(t){e.submitFlag(t,"click.remove_flag_comment")},this.handleLike=function(n){var t=e.props,c=t.courseId,i=t.itemId,s=t.subItemId;e.context.executeAction(o,{courseId:c,itemId:i,comment:n,subItemId:s}),e.context.track("click.like")}}return _inherits(ItemFeedbackContent,t),p(ItemFeedbackContent,[{key:"componentDidMount",value:function componentDidMount(){var e=this.props,t=e.courseId,n=e.itemId,c=e.subItemId;this.context.executeAction(s,{courseId:t,itemId:n,subItemId:c})}},{key:"submitFlag",value:function submitFlag(e,o){var t=this.props,i=t.courseId,s=t.itemId,a=t.subItemId,c={},r=!_(e).isEmpty();this.context.executeAction(d,{courseId:i,itemId:s,comments:e,subItemId:a,active:r}),_(e).each(function(e,t){e&&(c[t]=n.getLength(e))}),this.context.track(o,{flag_categories:c})}},{key:"render",value:function render(){var t=this.props,i=t.itemType,c=t.tooltipPlacement,o=t.flagFeedback,n=t.likeFeedback;return e.createElement("div",{className:"rc-ItemFeedbackContent"},e.createElement(f,{itemType:i,itemMetadata:this.props.itemMetadata,selected:o.isActive,comments:o.comments,tooltipPlacement:c,onSelect:this.handleFlag,onSubmit:this.handleFlagSubmit,onRemove:this.handleFlagRemove}),e.createElement(I,{withFeedback:!1,comment:n.comment,selected:n.isDislike,tooltipPlacement:c,onSelect:this.handleDislike,onDeselect:this.handleDislikeCancel,onComment:this.handleDislikeComment}),e.createElement(h,{withFeedback:!1,comment:n.comment,selected:n.isLike,tooltipPlacement:c,onSelect:this.handleLike,onDeselect:this.handleLikeCancel,onComment:this.handleLikeComment}))}}],[{key:"propTypes",value:{courseId:e.PropTypes.string.isRequired,itemId:e.PropTypes.string.isRequired,itemType:e.PropTypes.oneOf(_(u).values()).isRequired,itemMetadata:e.PropTypes.object,subItemId:e.PropTypes.string,likeFeedback:e.PropTypes.instanceOf(b),flagFeedback:e.PropTypes.instanceOf(m),tooltipPlacement:e.PropTypes.string},enumerable:!0},{key:"contextTypes",value:{executeAction:e.PropTypes.func.isRequired,track:e.PropTypes.func.isRequired},enumerable:!0}]),ItemFeedbackContent}(e.Component);module.exports=k(g,["ItemFeedbackStore"],function(t,n){var e=t.ItemFeedbackStore;return a({},n,{likeFeedback:e.getLikeFeedback(),flagFeedback:e.getFlagFeedback()})})});