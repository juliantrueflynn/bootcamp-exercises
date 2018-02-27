document.addEventListener("DOMContentLoaded", function(){
    // var canvas = document.getElementById('mycanvas');
    // var ctx = canvas.getContext('2d');
    // ctx.fillStyle = "blue";
    // ctx.beginPath();
    // ctx.arc(50, 50, 50, 0, 2 * Math.PI, false);
    // ctx.stroke();

    // var canvas2 = document.getElementById('mycanvas');
    // var ctx2 = canvas.getContext('2d');
    // ctx2.fillStyle = "red";
    // ctx2.fillRect(100, 100, 500, 500);

    // Favorite shape
    var canvas = document.getElementById('mycanvas');
    var ctx = canvas.getContext('2d');
    ctx.fillStyle = "green";
    ctx.beginPath();
    ctx.arc(75, 75, 50, 0, Math.PI * 2, true); // Outline
    ctx.moveTo(86, 80);
    ctx.arc(75, 80, 12, 0, Math.PI * 2, true); // Nose
    ctx.moveTo(110, 70);
    ctx.arc(75, 70, 35, 0, Math.PI); // Mouth
    ctx.moveTo(60, 65);
    ctx.arc(55, 65, 5, 0, Math.PI * 2, true); // Left eye
    ctx.moveTo(65, 55);
    ctx.arc(55, 55, 10, 0, Math.PI, true); // Left Eyebrow
    ctx.moveTo(100, 65);
    ctx.arc(95, 65, 5, 0, Math.PI * 2, true); // Right eye
    ctx.moveTo(105, 55);
    ctx.arc(95, 55, 10, 0, Math.PI, true);
    ctx.stroke();
});
