!function(t){var o={};function n(e){if(o[e])return o[e].exports;var r=o[e]={i:e,l:!1,exports:{}};return t[e].call(r.exports,r,r.exports,n),r.l=!0,r.exports}n.m=t,n.c=o,n.d=function(t,o,e){n.o(t,o)||Object.defineProperty(t,o,{configurable:!1,enumerable:!0,get:e})},n.r=function(t){Object.defineProperty(t,"__esModule",{value:!0})},n.n=function(t){var o=t&&t.__esModule?function(){return t.default}:function(){return t};return n.d(o,"a",o),o},n.o=function(t,o){return Object.prototype.hasOwnProperty.call(t,o)},n.p="",n(n.s=3)}([function(t,o){const n={inherits(t,o){t.prototype=Object.create(o.prototype),t.prototype.constructor=t},randomVec(t){const o=2*Math.PI*Math.random();return n.scale([Math.sin(o),Math.cos(o)],t)},scale:(t,o)=>[t[0]*o,t[1]*o]};t.exports=n},function(t,o){const n={DIM_X:"",DIM_Y:"",NUM_ASTEROIDS:3};function e(){this.dim_x=n.DIM_X,this.dim_y=n.DIM_Y,this.num_asteroids=n.NUM_ASTEROIDS}e.prototype.addAsteroids=function(){console.log("Hello!")},e.prototype.randomPosition=function(){},e.prototype.draw=function(t){},e.prototype.moveObjects=function(){},t.exports=e},function(t,o,n){const e=n(0),r=n(0),c=(new r({pos:[30,30],vel:[10,10],radius:5,color:"#00FF00"}),"#666666"),i="20",s=function(t={}){t.pos=e.randomVec,t.vel=e.randomVec,t.radius=i,t.color=c,r.call(this,t)};e.inherits(s,r),t.exports=s},function(t,o,n){n(2),n(1)}]);