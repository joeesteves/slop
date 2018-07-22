!function(){function e(e,t,n,i,a){function r(e,t){if(t=t||0,!e[0])throw"findAndReplaceDOMText cannot handle zero-length matches";var n=e.index;if(t>0){var i=e[t];if(!i)throw"Invalid capture group";n+=e[0].indexOf(i),e[0]=i}return[n,n+e[0].length,[e[0]]]}function o(e){var t;if(3===e.nodeType)return e.data;if(f[e.nodeName])return"";if(t="",(m[e.nodeName]||h[e.nodeName])&&(t+="\n"),e=e.firstChild)do t+=o(e);while(e=e.nextSibling);return t}function c(e,t,n){var i,a,r,o,c=[],s=0,d=e,l=t.shift(),u=0;e:for(;;){if((m[d.nodeName]||h[d.nodeName])&&s++,3===d.nodeType&&(!a&&d.length+s>=l[1]?(a=d,o=l[1]-s):i&&c.push(d),!i&&d.length+s>l[0]&&(i=d,r=l[0]-s),s+=d.length),i&&a){if(d=n({startNode:i,startNodeIndex:r,endNode:a,endNodeIndex:o,innerNodes:c,match:l[2],matchIndex:u}),s-=a.length-o,i=null,a=null,c=[],l=t.shift(),u++,!l)break}else{if(!f[d.nodeName]&&d.firstChild){d=d.firstChild;continue}if(d.nextSibling){d=d.nextSibling;continue}}for(;;){if(d.nextSibling){d=d.nextSibling;break}if(d.parentNode===e)break e;d=d.parentNode}}}function s(e){var t;if("function"!=typeof e){var n=e.nodeType?e:u.createElement(e);t=function(e,t){var i=n.cloneNode(!1);return i.setAttribute("data-mce-index",t),e&&i.appendChild(u.createTextNode(e)),i}}else t=e;return function(e){var n,i,a,r=e.startNode,o=e.endNode,c=e.matchIndex;if(r===o){var s=r;a=s.parentNode,e.startNodeIndex>0&&(n=u.createTextNode(s.data.substring(0,e.startNodeIndex)),a.insertBefore(n,s));var d=t(e.match[0],c);return a.insertBefore(d,s),e.endNodeIndex<s.length&&(i=u.createTextNode(s.data.substring(e.endNodeIndex)),a.insertBefore(i,s)),s.parentNode.removeChild(s),d}n=u.createTextNode(r.data.substring(0,e.startNodeIndex)),i=u.createTextNode(o.data.substring(e.endNodeIndex));for(var l=t(r.data.substring(e.startNodeIndex),c),m=[],f=0,h=e.innerNodes.length;h>f;++f){var p=e.innerNodes[f],g=t(p.data,c);p.parentNode.replaceChild(g,p),m.push(g)}var v=t(o.data.substring(0,e.endNodeIndex),c);return a=r.parentNode,a.insertBefore(n,r),a.insertBefore(l,r),a.removeChild(r),a=o.parentNode,a.insertBefore(v,o),a.insertBefore(i,o),a.removeChild(o),v}}var d,l,u,m,f,h,p=[],g=0;if(u=t.ownerDocument,m=a.getBlockElements(),f=a.getWhiteSpaceElements(),h=a.getShortEndedElements(),l=o(t)){if(e.global)for(;d=e.exec(l);)p.push(r(d,i));else d=l.match(e),p.push(r(d,i));return p.length&&(g=p.length,c(t,p,s(n))),g}}function t(t){function n(){var e=tinymce.ui.Factory.create({type:"window",layout:"flex",pack:"center",align:"center",onClose:function(){t.focus(),o=!1,c.unmarkAllMatches()},buttons:[{text:"Find",onclick:function(){e.find("form")[0].submit()}},{text:"Replace",disabled:!0,onclick:function(){c.replace(e.find("#replace").value())||e.statusbar.items().slice(1).disabled(!0)}},{text:"Replace all",disabled:!0,onclick:function(){c.replaceAll(e.find("#replace").value()),e.statusbar.items().slice(1).disabled(!0)}},{type:"spacer",flex:1},{text:"Prev",disabled:!0,onclick:function(){c.prev()}},{text:"Next",disabled:!0,onclick:function(){c.next()}}],title:"Find and replace",items:{type:"form",padding:20,labelGap:30,spacing:10,onsubmit:function(t){var n,i,a,r,o;return t.preventDefault(),a=e.find("#case").checked(),o=e.find("#words").checked(),r=e.find("#find").value(),r.length?(r=r.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g,"\\$&"),r=o?"\\b"+r+"\\b":r,i=new RegExp(r,a?"g":"gi"),n=c.markAllMatches(i),n?c.first():tinymce.ui.MessageBox.alert("Could not find the specified string."),e.statusbar.items().slice(1).disabled(0===n),void 0):(c.unmarkAllMatches(),e.statusbar.items().slice(1).disabled(!0),void 0)},items:[{type:"textbox",name:"find",size:40,label:"Find",value:t.selection.getNode().src},{type:"textbox",name:"replace",size:40,label:"Replace with"},{type:"checkbox",name:"case",text:"Match case",label:" "},{type:"checkbox",name:"words",text:"Whole words",label:" "}]}}).renderTo().reflow();o=!0}function i(e){var t=e.parentNode;t.insertBefore(e.firstChild,e),e.parentNode.removeChild(e)}function a(e,n){function i(){var i,o;for(i=n?t.getBody()[e?"firstChild":"lastChild"]:c[e?"endContainer":"startContainer"],o=new tinymce.dom.TreeWalker(i,t.getBody());i=o.current();){if(1==i.nodeType&&"SPAN"==i.nodeName&&null!==i.getAttribute("data-mce-index"))for(s=i.getAttribute("data-mce-index"),a=i.firstChild;i=o.current();){if(1==i.nodeType&&"SPAN"==i.nodeName&&null!==i.getAttribute("data-mce-index")){if(i.getAttribute("data-mce-index")!==s)return;r=i.firstChild}o[e?"next":"prev"]()}o[e?"next":"prev"]()}}var a,r,o=t.selection,c=o.getRng(!0),s=-1;return e=e!==!1,i(),a&&r&&(t.focus(),e?(c.setStart(a,0),c.setEnd(r,r.length)):(c.setStart(r,0),c.setEnd(a,a.length)),o.scrollIntoView(a.parentNode),o.setRng(c)),s}function r(e){e.parentNode.removeChild(e)}var o,c=this,s=-1;c.init=function(e){e.addMenuItem("searchreplace",{text:"Find and replace",shortcut:"Ctrl+F",onclick:n,separator:"before",context:"edit"}),e.addButton("searchreplace",{tooltip:"Find and replace",shortcut:"Ctrl+F",onclick:n}),e.addCommand("SearchReplace",n),e.shortcuts.add("Ctrl+F","",n)},c.markAllMatches=function(n){var i,a;return a=t.dom.create("span",{"class":"mce-match-marker","data-mce-bogus":1}),i=t.getBody(),c.unmarkAllMatches(i),e(n,i,a,!1,t.schema)},c.first=function(){return s=a(!0,!0),-1!==s},c.next=function(){return s=a(!0),-1!==s},c.prev=function(){return s=a(!1),-1!==s},c.replace=function(e,n,o){var c,d,l,u,m,f;if(-1===s&&(s=a(n)),f=a(n),l=t.getBody(),d=tinymce.toArray(l.getElementsByTagName("span")),d.length)for(c=0;c<d.length;c++){var h=d[c].getAttribute("data-mce-index");if(null!==h&&h.length&&(u=m=d[c].getAttribute("data-mce-index"),o||u===s))for(e.length?(d[c].firstChild.nodeValue=e,i(d[c])):r(d[c]);d[++c];)if(u=d[c].getAttribute("data-mce-index"),null!==h&&h.length){if(u!==m){c--;break}r(d[c])}}return-1==f&&(f=a(n,!0)),s=f,o&&t.selection.setCursorLocation(t.getBody(),0),t.undoManager.add(),-1!==s},c.replaceAll=function(e){c.replace(e,!0,!0)},c.unmarkAllMatches=function(){var e,n,a;for(a=t.getBody(),n=a.getElementsByTagName("span"),e=n.length;e--;)a=n[e],a.getAttribute("data-mce-index")&&i(a)},t.on("beforeaddundo keydown",function(e){return o?(e.preventDefault(),!1):void 0})}tinymce.PluginManager.add("searchreplace",t)}();