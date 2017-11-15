<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>支持移动设备的响应式js lightbox插件</title>
	<link rel="stylesheet" href="/third-party/bb/css/baguetteBox.css">
	<style type="text/css">
		h1, h2, h3, footer, .gallery {
		    text-align: center;
		}

		pre {
		    width: 340px;
		    margin: 0 auto;
		    border: dashed 1px #aaa;
		    margin-bottom: 10px;
		}

		@media (max-width: 480px) {
		    pre {
		        max-width: 98%;
		    }
		}

		header, footer {
		    display: block;
		    padding: .2em 0;
		    background-color: #555;
		    box-shadow: 0 0 8px #222;
		}

		footer {
		    margin-top: 1.5em;
		}

		.content {
		    max-width: 1160px;
		    margin: 0 auto;
		}

		.gallery:after {
		    content: '';
		    display: block;
		    height: 2px;
		    margin: .5em 0 1.4em;
		    background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0) 0%, rgba(77,77,77,1) 50%, rgba(0, 0, 0, 0) 100%);
		    background-image: linear-gradient(to right, rgba(0, 0, 0, 0) 0%, rgba(77,77,77,1) 50%, rgba(0, 0, 0, 0) 100%);
		}

		.gallery img {
		    height: 100%;
		}

		.gallery a {
		    width: 240px;
		    height: 180px;
		    display: inline-block;
		    overflow: hidden;
		    margin: 4px 6px;
		    box-shadow: 0 0 4px -1px #000;
		}

		.ribbon > img {
		    position: absolute;
		    top: 0;
		    right: 0;
		    border: 0;
		}

		@media (max-width: 768px) {
		    .sm-hidden {
		        display: none;
		    }
		}

		/* Highlight.js Tomorrow Night style */
		.hljs-comment,.hljs-quote{color:#969896}.hljs-deletion,.hljs-name,.hljs-regexp,.hljs-selector-class,.hljs-selector-id,.hljs-tag,.hljs-template-variable,.hljs-variable{color:#c66}.hljs-tag {color: #f8f8f2}.hljs-built_in,.hljs-builtin-name,.hljs-link,.hljs-literal,.hljs-meta,.hljs-number,.hljs-params,.hljs-type{color:#de935f}.hljs-attr{color:#f0c674}.hljs-addition,.hljs-bullet,.hljs-string,.hljs-symbol{color:#b5bd68}.hljs-section,.hljs-title{color:#81a2be}.hljs-keyword,.hljs-selector-tag{color:#b294bb}.hljs{display:block;overflow-x:auto;background:#1d1f21;color:#c5c8c6;padding:.8em}.hljs-emphasis{font-style:italic}.hljs-strong{font-weight:700}
	</style>
</head>
<body>
	<div class="jq22-container">
		
		<div class="content">
    <h2>Sample gallery</h2>

    <pre><code class="js">baguetteBox.run('.baguetteBoxOne');</code></pre>

    <div class="baguetteBoxOne gallery">
        <a href="/third-party/bb/img/big/2-1.png" data-caption="Golden Gate Bridge">
            <img src="/third-party/bb/img/thumbs/2-1.png" alt="Golden Gate Bridge">
        </a>
        <a href="/third-party/bb/img/big/2-2.png" title="Midnight City">
            <img src="/third-party/bb/img/thumbs/2-2.png" alt="Midnight City">
        </a>
        <a href="/third-party/bb/img/big/2-3.png">
            <img src="/third-party/bb/img/thumbs/2-3.png" alt="">
        </a>
        <a href="/third-party/bb/img/big/2-4.png">
            <img src="/third-party/bb/img/thumbs/2-4.png" alt="">
        </a>
       	
    </div>

    <h2>Responsive images</h2>

<pre><code class="js">baguetteBox.run('.baguetteBoxTwo');</code></pre>
<pre><code class="html">&lt;a href=&quot;img/2-1.png&quot;
    data-at-450=&quot;img/thumbs/2-1.png&quot;
    data-at-800=&quot;img/small/2-1.png&quot;
    data-at-1366=&quot;img/medium/2-1.png&quot;
    data-at-1920=&quot;img/big/2-1.png&quot;&gt;
        &lt;img src=&quot;img/thumbs/2-1.png&quot;&gt;
&lt;/a&gt;</code></pre>

    <div class="baguetteBoxTwo gallery">
        <a href="/third-party/bb/img/2-1.png" data-at-450="/third-party/bb/img/thumbs/2-1.png" data-at-800="/third-party/bb/img/big/2-1.png" data-at-1366="/third-party/bb/img/big/2-1.png" data-at-1920="/third-party/bb/img/big/2-1.png">
            <img src="/third-party/bb/img/thumbs/2-1.png" alt="">
        </a>
        <a href="/third-party/bb/img/2-2.png" data-at-450="/third-party/bb/img/thumbs/2-2.png" data-at-800="/third-party/bb/img/big/2-2.png" data-at-1366="/third-party/bb/img/big/2-2.png" data-at-1920="/third-party/bb/img/big/2-2.png">
            <img src="/third-party/bb/img/thumbs/2-2.png" alt="">
        </a>
        <a href="/third-party/bb/img/2-3.png" data-at-450="/third-party/bb/img/thumbs/2-3.png" data-at-800="/third-party/bb/img/big/2-3.png" data-at-1366="/third-party/bb/img/big/2-3.png" data-at-1920="/third-party/bb/img/big/2-3.png">
            <img src="/third-party/bb/img/thumbs/2-3.png" alt="">
        </a>
        <a href="/third-party/bb/img/2-4.png" data-at-450="/third-party/bb/img/thumbs/2-4.png" data-at-800="i/third-party/bb/mg/big/2-4.png" data-at-1366="/third-party/bb/img/big/2-4.png" data-at-1920="/third-party/bb/img/big/2-4.png">
            <img src="/third-party/bb/img/thumbs/2-4.png" alt="">
        </a>
    </div>

    <h2>FadeIn animation</h2>

<pre><code class="js">baguetteBox.run('.baguetteBoxThree', {
    animation: 'fadeIn',
    noScrollbars: true
});</code></pre>

    <div class="baguetteBoxThree gallery">
        <a href="/third-party/bb/img/big/2-1.png">
            <img src="/third-party/bb/img/thumbs/2-1.png" alt="">
        </a>
        <a href="/third-party/bb/img/big/2-2.png">
            <img src="/third-party/bb/img/thumbs/2-2.png" alt="">
        </a>
        <a href="/third-party/bb/img/big/2-3.png">
            <img src="/third-party/bb/img/thumbs/2-3.png" alt="">
        </a>
        <a href="/third-party/bb/img/big/2-4.png">
            <img src="/third-party/bb/img/thumbs/2-4.png" alt="">
        </a>
    </div>

    <h2>Small images, buttons disabled (use arrows or swipe gesture)</h2>

<pre><code class="js">baguetteBox.run('.baguetteBoxFour', {
    buttons: false
});</code></pre>

    <div class="baguetteBoxFour gallery">
        <a href="/third-party/bb/img/big/2-1.png" data-caption="Balloon trip">
            <img src="/third-party/bb/img/thumbs/2-1.png" alt="Balloon trip">
        </a>
        <a href="/third-party/bb/img/big/2-2.png" data-caption="Road to nowhere">
            <img src="/third-party/bb/img/thumbs/2-2.png" alt="Road to nowhere">
        </a>
        <a href="/third-party/bb/img/big/2-3.png" data-caption="Misty landscape">
            <img src="/third-party/bb/img/thumbs/2-3.png" alt="Misty landscape">
        </a>
        <a href="/third-party/bb/img/big/2-4.png" data-caption="Forest">
            <img src="/third-party/bb/img/thumbs/2-4.png" alt="Forest">
        </a>
    </div>

    <h2>Single image (buttons hidden by default, custom caption function)</h2>

<pre style="width: 520px"><code class="js">baguetteBox.run('.baguetteBoxFive', {
    captions: function(element) {
        return element.getElementsByTagName('img')[0].alt;
    }
});</code></pre>

    <div class="baguetteBoxFive gallery">
        <a href="/third-party/bb/img/big/2-1.png">
            <img src="/third-party/bb/img/thumbs/2-1.png" alt="A caption in the alt attribute">
        </a>
    </div>

</div>
		
	</div>
	
	<script src="/third-party/bb/js/baguetteBox.js" async></script>
	<script src="/third-party/bb/js/highlight.min.js" async></script>
	<!--[if lt IE 9]>
	<script>
	var oldIE = true;
	</script>
	<![endif]-->
	<script>
	window.onload = function() {
	    baguetteBox.run('.baguetteBoxOne');
	    baguetteBox.run('.baguetteBoxTwo');
	    baguetteBox.run('.baguetteBoxThree', {
	        animation: 'fadeIn',
	        noScrollbars: true
	    });
	    baguetteBox.run('.baguetteBoxFour', {
	        buttons: false
	    });
	    baguetteBox.run('.baguetteBoxFive', {
	        captions: function(element) {
	            return element.getElementsByTagName('img')[0].alt;
	        }
	    });

	    if (typeof oldIE === 'undefined' && Object.keys) {
	        hljs.initHighlighting();
	    }
	};
	</script>
</body>
</html>