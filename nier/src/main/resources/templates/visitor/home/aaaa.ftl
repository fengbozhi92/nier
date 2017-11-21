<!DOCTYPE html>
<html lang="en">
<head>
  <title>Checkboxes and radio buttons customization (jQuery and Zepto) plugin</title>
  <meta charset="utf-8">
  <meta content="width=device-width" name="viewport">
  <link href="/third-party/icheck/skins/all.css" rel="stylesheet">
  <script src="/third-party/jquery/jquery-1.11.0.min.js"></script>
  <script src="/third-party/icheck/js/icheck.min.js?"></script>
</head>
<body>
  <div class="layout clear">
    <div class="header">
      <h1>super customized checkboxes and radio buttons for jQuery &amp; Zepto</h1>
      <h3>iCheck <span>v1.0.2</span></h3>
      <strong>@<a href="http://twitter.com/fronteed/">Fronteed</a></strong>
    </div>
    <div class="features">
      <div class="arrows">
        <div class="bottom" data-to="demo"></div>
      </div>
      <h2>插件特点</h2>
      <ul>
        <li>
          <strong>在不同浏览器和设备上都有相同的表现</strong> — 包括 <span class="self" data-to="download">桌面和移动设备</span>
        </li>
        <li>
          <strong>支持触摸设备</strong> — iOS、Android、BlackBerry、Windows Phone
        </li>
        <li>
          <strong>支持键盘导航</strong> — <span class="mark">Tab</span>、<span class="mark">Spacebar</span>、<span class="mark">Arrow up/down</span> 和其它快捷键
        </li>
        <li>
          <strong>方便定制</strong> — 用HTML 和 CSS 即可为其设置样式 (试试 <span class="self" data-to="skins">6 套针对Retina屏幕的皮肤吧</span>)
        </li>
        <li>
          <strong>支持 jQuery 和 Zepto</strong> JavaScript工具库
        </li>
        <li>
          <strong>体积小巧</strong> — gzip压缩后只有1 kb
        </li>
        <li class="offset">
          <strong class="self" data-to="options">25 种参数</strong> 用来定制复选框（checkbox）和单选按钮（radio button）
        </li>
        <li>
          <strong class="self" data-to="callbacks">8 个回调事件</strong> 用来监听输入框的状态
        </li>
        <li>
          <strong class="self" data-to="methods">7 个方法</strong> 用来通过编程方式控制输入框的状态
        </li>
        <li>
          能够将输入框的状态变化同步回原始输入框中， <span class="self" data-to="init">支持</span>所有选择器
        </li>
      </ul>
    </div>
    
    <div class="demo-holder">
      <h2 class="demo-title">案例</h2>
      <div class="demo">
        <div class="arrows">
          <div class="top" data-to="features"></div>
          <div class="bottom" data-to="skins"></div>
        </div>
        <div class="demo-list clear">
          <ul>
            <li>
              <input tabindex="1" type="checkbox" id="input-1">
              <label for="input-1">Checkbox, <span>#input-1</span></label>
            </li>
            <li>
              <input tabindex="2" type="checkbox" id="input-2" checked>
              <label for="input-2">Checkbox, <span>#input-2</span></label>
            </li>
          </ul>
          <ul>
            <li>
              <input tabindex="3" type="radio" id="input-3" name="demo-radio">
              <label for="input-3">Radio button, <span>#input-3</span></label>
            </li>
            <li>
              <input tabindex="4" type="radio" id="input-4" name="demo-radio" checked>
              <label for="input-4">Radio button, <span>#input-4</span></label>
            </li>
          </ul>
          <script>
          $(document).ready(function(){
            var callbacks_list = $('.demo-callbacks ul');
            $('.demo-list input').on('ifCreated ifClicked ifChanged ifChecked ifUnchecked ifDisabled ifEnabled ifDestroyed', function(event){
              callbacks_list.prepend('<li><span>#' + this.id + '</span> is ' + event.type.replace('if', '').toLowerCase() + '</li>');
            }).iCheck({
              checkboxClass: 'icheckbox_square-blue',
              radioClass: 'iradio_square-blue',
              increaseArea: '20%'
            });
          });
          </script>
        </div>
        <dl class="demo-methods">
          <dt>
            <span class="self do-check">Add <span class="mark">checked</span> state to 1 and 3 inputs</span>
            <span class="code">
              <span class="self">查看代码</span>
            </span>
          </dt>
          <dd>
<pre class="markup">
$('#input-1, #input-3').iCheck('check');
</pre>
          </dd>
          <dt>
            <span class="self do-uncheck">Remove <span class="mark">checked</span> state from 1 and 3 inputs</span>
            <span class="code">
              <span class="self">查看代码</span>
            </span>
          </dt>
          <dd>
<pre class="markup">
$('#input-1, #input-3').iCheck('uncheck');
</pre>
          </dd>
          <dt>
            <span class="self do-disable">Add <span class="mark">disabled</span> state to 2 and 4 inputs</span>
            <span class="code">
              <span class="self">查看代码</span>
            </span>
          </dt>
          <dd>
<pre class="markup">
$('#input-2, #input-4').iCheck('disable');
</pre>
          </dd>
          <dt>
            <span class="self do-enable">Remove <span class="mark">disabled</span> state from 2 and 4 inputs</span>
            <span class="code">
              <span class="self">查看代码</span>
            </span>
          </dt>
          <dd>
<pre class="markup">
$('#input-2, #input-4').iCheck('enable');
</pre>
          </dd>
          <dt>
            <span class="self do-destroy">Remove all traces of iCheck</span>
            <span class="code">
              <span class="self">查看代码</span>
            </span>
          </dt>
          <dd>
<pre class="markup">
$('input').iCheck('destroy');
</pre>
          </dd>
        </dl>
        <div class="demo-callbacks">
          <h2>回掉函数</h2>
          <ul></ul>
        </div>
      </div>
    </div>
    <div class="skins">
      <h2>皮肤</h2>
      <div class="skin skin-minimal">
        <div class="arrows">
          <div class="top" data-to="demo"></div>
          <div class="bottom" data-to="skin-square"></div>
        </div>
        <h3>Minimal 皮肤</h3>
        <dl class="clear">
          <dd class="selected">
            <div class="skin-section">
              <h4>Live</h4>
              <ul class="list">
                <li>
                  <input tabindex="5" type="checkbox" id="minimal-checkbox-1">
                  <label for="minimal-checkbox-1">Checkbox 1</label>
                </li>
                <li>
                  <input tabindex="6" type="checkbox" id="minimal-checkbox-2" checked>
                  <label for="minimal-checkbox-2">Checkbox 2</label>
                </li>
                <li>
                  <input type="checkbox" id="minimal-checkbox-disabled" disabled>
                  <label for="minimal-checkbox-disabled">Disabled</label>
                </li>
                <li>
                  <input type="checkbox" id="minimal-checkbox-disabled-checked" checked disabled>
                  <label for="minimal-checkbox-disabled-checked">Disabled &amp; checked</label>
                </li>
              </ul>
              <ul class="list">
                <li>
                  <input tabindex="7" type="radio" id="minimal-radio-1" name="minimal-radio">
                  <label for="minimal-radio-1">Radio button 1</label>
                </li>
                <li>
                  <input tabindex="8" type="radio" id="minimal-radio-2" name="minimal-radio" checked>
                  <label for="minimal-radio-2">Radio button 2</label>
                </li>
                <li>
                  <input type="radio" id="minimal-radio-disabled" disabled>
                  <label for="minimal-radio-disabled">Disabled</label>
                </li>
                <li>
                  <input type="radio" id="minimal-radio-disabled-checked" checked disabled>
                  <label for="minimal-radio-disabled-checked">Disabled &amp; checked</label>
                </li>
              </ul>
              <div class="colors clear">
                <strong>Color 主题</strong>
                <ul>
                  <li class="active" title="Black"></li>
                  <li class="red" title="Red"></li>
                  <li class="green" title="Green"></li>
                  <li class="blue" title="Blue"></li>
                  <li class="aero" title="Aero"></li>
                  <li class="grey" title="Grey"></li>
                  <li class="orange" title="Orange"></li>
                  <li class="yellow" title="Yellow"></li>
                  <li class="pink" title="Pink"></li>
                  <li class="purple" title="Purple"></li>
                </ul>
              </div>
            </div>
            <div class="skin-section skin-states">
              <h4>States</h4>
              <ul class="list">
                <li>
                  <div class="state icheckbox_minimal"></div>
                  <div class="state iradio_minimal"></div>
                  Normal
                </li>
                <li>
                  <div class="state icheckbox_minimal hover"></div>
                  <div class="state iradio_minimal hover"></div>
                  Hover
                </li>
                <li>
                  <div class="state icheckbox_minimal checked"></div>
                  <div class="state iradio_minimal checked"></div>
                  Checked
                </li>
                <li>
                  <div class="state icheckbox_minimal disabled"></div>
                  <div class="state iradio_minimal disabled"></div>
                  Disabled
                </li>
                <li>
                  <div class="state icheckbox_minimal checked disabled"></div>
                  <div class="state iradio_minimal checked disabled"></div>
                  Disabled &amp; checked
                </li>
              </ul>
            </div>
            <script>
            $(document).ready(function(){
              $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox_minimal',
                radioClass: 'iradio_minimal',
                increaseArea: '20%'
              });
            });
            </script>
          </dd>
          <dt class="selected">Demo</dt>
          <dd>
            <div class="skin-pre">
              <p>
                Make sure <a href="http://jquery.com" target="blank">jQuery v1.7+</a> (or <a href="http://github.com/madrobby/zepto#zepto-modules" target="blank">Zepto</a> [polyfill, event, data]) is loaded before the <span class="mark">icheck.js</span>.
              </p>
            </div>
            <ol class="skin-usage">
              <li>
                Choose a color scheme, there are 10 different styles available:
                <div class="schemes clear">
                  <ul>
                    <li><strong>Black</strong> &mdash; minimal.css</li>
                    <li><strong>Red</strong> &mdash; red.css</li>
                    <li><strong>Green</strong> &mdash; green.css</li>
                    <li><strong>Blue</strong> &mdash; blue.css</li>
                    <li><strong>Aero</strong> &mdash; aero.css</li>
                  </ul>
                  <ul>
                    <li><strong>Grey</strong> &mdash; grey.css</li>
                    <li><strong>Orange</strong> &mdash; orange.css</li>
                    <li><strong>Yellow</strong> &mdash; yellow.css</li>
                    <li><strong>Pink</strong> &mdash; pink.css</li>
                    <li><strong>Purple</strong> &mdash; purple.css</li>
                  </ul>
                </div>
              </li>
              <li>
                Copy <span class="mark">/skins/minimal/</span> folder and <span class="mark">icheck.js</span>  file to your site.
              </li>
              <li>
                <p>Insert before <span class="mark">&lt;/head></span> in your HTML (replace <span class="mark">your-path</span> and <span class="mark">color-scheme</span>):</p>
<pre class="markup">
&lt;link href="your-path/minimal/color-scheme.css" rel="stylesheet">
&lt;script src="your-path/icheck.js">&lt;/script>
</pre>
                <p>Example for a <strong>Red</strong> color scheme:</p>
<pre class="markup">
&lt;link href="your-path/minimal/red.css" rel="stylesheet">
&lt;script src="your-path/icheck.js">&lt;/script>
</pre>
              </li>
              <li>
                <p>Add some checkboxes and radio buttons to your HTML:</p>
<pre class="markup">
&lt;input type="checkbox">
&lt;input type="checkbox" checked>
&lt;input type="radio" name="iCheck">
&lt;input type="radio" name="iCheck" checked>
</pre>
              </li>
              <li>
                <p>Add JavaScript to your HTML to launch iCheck plugin:</p>
<pre class="markup">
&lt;script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_minimal',
    radioClass: 'iradio_minimal',
    increaseArea: '20%' <span class="comment">// optional</span>
  });
});
&lt;/script>
</pre>
                <p>For different from black color schemes use this code (example for <strong>Red</strong>):</p>
<pre class="markup">
&lt;script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_minimal-red',
    radioClass: 'iradio_minimal-red',
    increaseArea: '20%' <span class="comment">// optional</span>
  });
});
&lt;/script>
</pre>
              </li>
              <li>Done.</li>
            </ol>
          </dd>
          <dt>使用说明</dt>
        </dl>
      </div>
      <div class="skin skin-square">
        <div class="arrows">
          <div class="top" data-to="skin-minimal"></div>
          <div class="bottom" data-to="skin-flat"></div>
        </div>
        <h3>Square 皮肤</h3>
        <dl class="clear">
          <dd class="selected">
            <div class="skin-section">
              <h4>Live</h4>
              <ul class="list">
                <li>
                  <input tabindex="9" type="checkbox" id="square-checkbox-1">
                  <label for="square-checkbox-1">Checkbox 1</label>
                </li>
                <li>
                  <input tabindex="10" type="checkbox" id="square-checkbox-2" checked>
                  <label for="square-checkbox-2">Checkbox 2</label>
                </li>
                <li>
                  <input type="checkbox" id="square-checkbox-disabled" disabled>
                  <label for="square-checkbox-disabled">Disabled</label>
                </li>
                <li>
                  <input type="checkbox" id="square-checkbox-disabled-checked" checked disabled>
                  <label for="square-checkbox-disabled-checked">Disabled &amp; checked</label>
                </li>
              </ul>
              <ul class="list">
                <li>
                  <input tabindex="11" type="radio" id="square-radio-1" name="square-radio">
                  <label for="square-radio-1">Radio button 1</label>
                </li>
                <li>
                  <input tabindex="12" type="radio" id="square-radio-2" name="square-radio" checked>
                  <label for="square-radio-2">Radio button 2</label>
                </li>
                <li>
                  <input type="radio" id="square-radio-disabled" disabled>
                  <label for="square-radio-disabled">Disabled</label>
                </li>
                <li>
                  <input type="radio" id="square-radio-disabled-checked" checked disabled>
                  <label for="square-radio-disabled-checked">Disabled &amp; checked</label>
                </li>
              </ul>
              <div class="colors clear">
                <strong>Color schemes</strong>
                <ul>
                  <li title="Black"></li>
                  <li class="red" title="Red"></li>
                  <li class="green active" title="Green"></li>
                  <li class="blue" title="Blue"></li>
                  <li class="aero" title="Aero"></li>
                  <li class="grey" title="Grey"></li>
                  <li class="orange" title="Orange"></li>
                  <li class="yellow" title="Yellow"></li>
                  <li class="pink" title="Pink"></li>
                  <li class="purple" title="Purple"></li>
                </ul>
              </div>
            </div>
            <div class="skin-section skin-states">
              <h4>States</h4>
              <ul class="list">
                <li>
                  <div class="state icheckbox_square-green"></div>
                  <div class="state iradio_square-green"></div>
                  Normal
                </li>
                <li>
                  <div class="state icheckbox_square-green hover"></div>
                  <div class="state iradio_square-green hover"></div>
                  Hover
                </li>
                <li>
                  <div class="state icheckbox_square-green checked"></div>
                  <div class="state iradio_square-green checked"></div>
                  Checked
                </li>
                <li>
                  <div class="state icheckbox_square-green disabled"></div>
                  <div class="state iradio_square-green disabled"></div>
                  Disabled
                </li>
                <li>
                  <div class="state icheckbox_square-green checked disabled"></div>
                  <div class="state iradio_square-green checked disabled"></div>
                  Disabled &amp; checked
                </li>
              </ul>
            </div>
            <script>
            $(document).ready(function(){
              $('.skin-square input').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
                increaseArea: '20%'
              });
            });
            </script>
          </dd>
          <dt class="selected">Demo</dt>
          <dd>
            <div class="skin-pre">
              <p>
                Make sure <a href="http://jquery.com" target="blank">jQuery v1.7+</a> (or <a href="http://github.com/madrobby/zepto#zepto-modules" target="blank">Zepto</a> [polyfill, event, data]) is loaded before the <span class="mark">icheck.js</span>.
              </p>
            </div>
            <ol class="skin-usage">
              <li>
                Choose a color scheme, there are 10 different styles available:
                <div class="schemes clear">
                  <ul>
                    <li><strong>Black</strong> &mdash; square.css</li>
                    <li><strong>Red</strong> &mdash; red.css</li>
                    <li><strong>Green</strong> &mdash; green.css</li>
                    <li><strong>Blue</strong> &mdash; blue.css</li>
                    <li><strong>Aero</strong> &mdash; aero.css</li>
                  </ul>
                  <ul>
                    <li><strong>Grey</strong> &mdash; grey.css</li>
                    <li><strong>Orange</strong> &mdash; orange.css</li>
                    <li><strong>Yellow</strong> &mdash; yellow.css</li>
                    <li><strong>Pink</strong> &mdash; pink.css</li>
                    <li><strong>Purple</strong> &mdash; purple.css</li>
                  </ul>
                </div>
              </li>
              <li>
                Copy <span class="mark">/skins/square/</span> folder and <span class="mark">icheck.js</span> file to your site.
              </li>
              <li>
                <p>Insert before <span class="mark">&lt;/head></span> in your HTML (replace <span class="mark">your-path</span> and <span class="mark">color-scheme</span>):</p>
<pre class="markup">
&lt;link href="your-path/square/color-scheme.css" rel="stylesheet">
&lt;script src="your-path/icheck.js">&lt;/script>
</pre>
                <p>Example for a <strong>Red</strong> color scheme:</p>
<pre class="markup">
&lt;link href="your-path/square/red.css" rel="stylesheet">
&lt;script src="your-path/icheck.js">&lt;/script>
</pre>
              </li>
              <li>
                <p>Add some checkboxes and radio buttons to your HTML:</p>
<pre class="markup">
&lt;input type="checkbox">
&lt;input type="checkbox" checked>
&lt;input type="radio" name="iCheck">
&lt;input type="radio" name="iCheck" checked>
</pre>
              </li>
              <li>
                <p>Add JavaScript to your HTML to launch iCheck plugin:</p>
<pre class="markup">
&lt;script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_square',
    radioClass: 'iradio_square',
    increaseArea: '20%' <span class="comment">// optional</span>
  });
});
&lt;/script>
</pre>
                <p>For different from black color schemes use this code (example for <strong>Red</strong>):</p>
<pre class="markup">
&lt;script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-red',
    radioClass: 'iradio_square-red',
    increaseArea: '20%' <span class="comment">// optional</span>
  });
});
&lt;/script>
</pre>
              </li>
              <li>Done.</li>
            </ol>
          </dd>
          <dt>使用说明</dt>
        </dl>
      </div>
      <div class="skin skin-flat">
        <div class="arrows">
          <div class="top" data-to="skin-square"></div>
          <div class="bottom" data-to="skin-line"></div>
        </div>
        <h3>Flat 皮肤</h3>
        <dl class="clear">
          <dd class="selected">
            <div class="skin-section">
              <h4>Live</h4>
              <ul class="list">
                <li>
                  <input tabindex="13" type="checkbox" id="flat-checkbox-1">
                  <label for="flat-checkbox-1">Checkbox 1</label>
                </li>
                <li>
                  <input tabindex="14" type="checkbox" id="flat-checkbox-2" checked>
                  <label for="flat-checkbox-2">Checkbox 2</label>
                </li>
                <li>
                  <input type="checkbox" id="flat-checkbox-disabled" disabled>
                  <label for="flat-checkbox-disabled">Disabled</label>
                </li>
                <li>
                  <input type="checkbox" id="flat-checkbox-disabled-checked" checked disabled>
                  <label for="flat-checkbox-disabled-checked">Disabled &amp; checked</label>
                </li>
              </ul>
              <ul class="list">
                <li>
                  <input tabindex="15" type="radio" id="flat-radio-1" name="flat-radio">
                  <label for="flat-radio-1">Radio button 1</label>
                </li>
                <li>
                  <input tabindex="16" type="radio" id="flat-radio-2" name="flat-radio" checked>
                  <label for="flat-radio-2">Radio button 2</label>
                </li>
                <li>
                  <input type="radio" id="flat-radio-disabled" disabled>
                  <label for="flat-radio-disabled">Disabled</label>
                </li>
                <li>
                  <input type="radio" id="flat-radio-disabled-checked" checked disabled>
                  <label for="flat-radio-disabled-checked">Disabled &amp; checked</label>
                </li>
              </ul>
              <div class="colors clear">
                <strong>Color schemes</strong>
                <ul>
                  <li title="Black"></li>
                  <li class="red active" title="Red"></li>
                  <li class="green" title="Green"></li>
                  <li class="blue" title="Blue"></li>
                  <li class="aero" title="Aero"></li>
                  <li class="grey" title="Grey"></li>
                  <li class="orange" title="Orange"></li>
                  <li class="yellow" title="Yellow"></li>
                  <li class="pink" title="Pink"></li>
                  <li class="purple" title="Purple"></li>
                </ul>
              </div>
            </div>
            <div class="skin-section skin-states">
              <h4>States</h4>
              <ul class="list">
                <li>
                  <div class="state icheckbox_flat-red"></div>
                  <div class="state iradio_flat-red"></div>
                  Normal
                </li>
                <li>
                  <div class="state icheckbox_flat-red checked"></div>
                  <div class="state iradio_flat-red checked"></div>
                  Checked
                </li>
                <li>
                  <div class="state icheckbox_flat-red disabled"></div>
                  <div class="state iradio_flat-red disabled"></div>
                  Disabled
                </li>
                <li>
                  <div class="state icheckbox_flat-red checked disabled"></div>
                  <div class="state iradio_flat-red checked disabled"></div>
                  Disabled &amp; checked
                </li>
              </ul>
            </div>
            <script>
            $(document).ready(function(){
              $('.skin-flat input').iCheck({
                checkboxClass: 'icheckbox_flat-red',
                radioClass: 'iradio_flat-red'
              });
            });
            </script>
          </dd>
          <dt class="selected">Demo</dt>
          <dd>
            <div class="skin-pre">
              <p>
                Make sure <a href="http://jquery.com" target="blank">jQuery v1.7+</a> (or <a href="http://github.com/madrobby/zepto#zepto-modules" target="blank">Zepto</a> [polyfill, event, data]) is loaded before the <span class="mark">icheck.js</span>.
              </p>
            </div>
            <ol class="skin-usage">
              <li>
                Choose a color scheme, there are 10 different styles available:
                <div class="schemes clear">
                  <ul>
                    <li><strong>Black</strong> &mdash; square.css</li>
                    <li><strong>Red</strong> &mdash; red.css</li>
                    <li><strong>Green</strong> &mdash; green.css</li>
                    <li><strong>Blue</strong> &mdash; blue.css</li>
                    <li><strong>Aero</strong> &mdash; aero.css</li>
                  </ul>
                  <ul>
                    <li><strong>Grey</strong> &mdash; grey.css</li>
                    <li><strong>Orange</strong> &mdash; orange.css</li>
                    <li><strong>Yellow</strong> &mdash; yellow.css</li>
                    <li><strong>Pink</strong> &mdash; pink.css</li>
                    <li><strong>Purple</strong> &mdash; purple.css</li>
                  </ul>
                </div>
              </li>
              <li>
                Copy <span class="mark">/skins/flat/</span> folder and <span class="mark">icheck.js</span> file to your site.
              </li>
              <li>
                <p>Insert before <span class="mark">&lt;/head></span> in your HTML (replace <span class="mark">your-path</span> and <span class="mark">color-scheme</span>):</p>
<pre class="markup">
&lt;link href="your-path/flat/color-scheme.css" rel="stylesheet">
&lt;script src="your-path/icheck.js">&lt;/script>
</pre>
                <p>Example for a <strong>Red</strong> color scheme:</p>
<pre class="markup">
&lt;link href="your-path/flat/red.css" rel="stylesheet">
&lt;script src="your-path/icheck.js">&lt;/script>
</pre>
              </li>
              <li>
                <p>Add some checkboxes and radio buttons to your HTML:</p>
<pre class="markup">
&lt;input type="checkbox">
&lt;input type="checkbox" checked>
&lt;input type="radio" name="iCheck">
&lt;input type="radio" name="iCheck" checked>
</pre>
              </li>
              <li>
                <p>Add JavaScript to your HTML to launch iCheck plugin:</p>
<pre class="markup">
&lt;script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_flat',
    radioClass: 'iradio_flat'
  });
});
&lt;/script>
</pre>
                <p>For different from black color schemes use this code (example for <strong>Red</strong>):</p>
<pre class="markup">
&lt;script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_flat-red',
    radioClass: 'iradio_flat-red'
  });
});
&lt;/script>
</pre>
              </li>
              <li>Done.</li>
            </ol>
          </dd>
          <dt>使用说明</dt>
        </dl>
      </div>
      <div class="skin skin-line">
        <div class="arrows">
          <div class="top" data-to="skin-flat"></div>
          <div class="bottom" data-to="skin-polaris"></div>
        </div>
        <h3>Line 皮肤</h3>
        <dl class="clear">
          <dd class="selected">
            <div class="skin-section">
              <h4>Live</h4>
              <ul class="list">
                <li>
                  <input tabindex="17" type="checkbox" id="line-checkbox-1">
                  <label for="line-checkbox-1">Checkbox 1</label>
                </li>
                <li>
                  <input tabindex="18" type="checkbox" id="line-checkbox-2" checked>
                  <label for="line-checkbox-2">Checkbox 2</label>
                </li>
                <li>
                  <input type="checkbox" id="line-checkbox-disabled" disabled>
                  <label for="line-checkbox-disabled">Disabled</label>
                </li>
                <li>
                  <input type="checkbox" id="line-checkbox-disabled-checked" checked disabled>
                  <label for="line-checkbox-disabled-checked">Disabled &amp; checked</label>
                </li>
              </ul>
              <ul class="list">
                <li>
                  <input tabindex="19" type="radio" id="line-radio-1" name="line-radio">
                  <label for="line-radio-1">Radio button 1</label>
                </li>
                <li>
                  <input tabindex="20" type="radio" id="line-radio-2" name="line-radio" checked>
                  <label for="line-radio-2">Radio button 2</label>
                </li>
                <li>
                  <input type="radio" id="line-radio-disabled" disabled>
                  <label for="line-radio-disabled">Disabled</label>
                </li>
                <li>
                  <input type="radio" id="line-radio-disabled-checked" checked disabled>
                  <label for="line-radio-disabled-checked">Disabled &amp; checked</label>
                </li>
              </ul>
              <div class="colors clear">
                <strong>Color schemes</strong>
                <ul>
                  <li title="Black"></li>
                  <li class="red" title="Red"></li>
                  <li class="green" title="Green"></li>
                  <li class="blue active" title="Blue"></li>
                  <li class="aero" title="Aero"></li>
                  <li class="grey" title="Grey"></li>
                  <li class="orange" title="Orange"></li>
                  <li class="yellow" title="Yellow"></li>
                  <li class="pink" title="Pink"></li>
                  <li class="purple" title="Purple"></li>
                </ul>
              </div>
            </div>
            <div class="skin-section skin-states">
              <h4>States</h4>
              <ul class="list">
                <li>
                  <div class="state icheckbox_line-blue">
                    <div class="icheck_line-icon"></div>
                    Normal
                  </div>
                </li>
                <li>
                  <div class="state icheckbox_line-blue hover">
                    <div class="icheck_line-icon"></div>
                    Hover
                  </div>
                </li>
                <li>
                  <div class="state icheckbox_line-blue checked">
                    <div class="icheck_line-icon"></div>
                    Checked
                  </div>
                </li>
                <li>
                  <div class="state icheckbox_line-blue disabled">
                    <div class="icheck_line-icon"></div>
                    Disabled
                  </div>
                </li>
                <li>
                  <div class="state icheckbox_line-blue checked disabled">
                    <div class="icheck_line-icon"></div>
                    Disabled &amp; checked
                  </div>
                </li>
              </ul>
            </div>
            <script>
            $(document).ready(function(){
              $('.skin-line input').each(function(){
                var self = $(this),
                  label = self.next(),
                  label_text = label.text();

                label.remove();
                self.iCheck({
                  checkboxClass: 'icheckbox_line-blue',
                  radioClass: 'iradio_line-blue',
                  insert: '<div class="icheck_line-icon"></div>' + label_text
                });
              });
            });
            </script>
          </dd>
          <dt class="selected">Demo</dt>
          <dd>
            <div class="skin-pre">
              <p>
                Make sure <a href="http://jquery.com" target="blank">jQuery v1.7+</a> (or <a href="http://github.com/madrobby/zepto#zepto-modules" target="blank">Zepto</a> [polyfill, event, data]) is loaded before the <span class="mark">icheck.js</span>.
              </p>
            </div>
            <ol class="skin-usage">
              <li>
                Choose a color scheme, there are 10 different styles available:
                <div class="schemes clear">
                  <ul>
                    <li><strong>Black</strong> &mdash; line.css</li>
                    <li><strong>Red</strong> &mdash; red.css</li>
                    <li><strong>Green</strong> &mdash; green.css</li>
                    <li><strong>Blue</strong> &mdash; blue.css</li>
                    <li><strong>Aero</strong> &mdash; aero.css</li>
                  </ul>
                  <ul>
                    <li><strong>Grey</strong> &mdash; grey.css</li>
                    <li><strong>Orange</strong> &mdash; orange.css</li>
                    <li><strong>Yellow</strong> &mdash; yellow.css</li>
                    <li><strong>Pink</strong> &mdash; pink.css</li>
                    <li><strong>Purple</strong> &mdash; purple.css</li>
                  </ul>
                </div>
              </li>
              <li>
                Copy <span class="mark">/skins/line/</span> folder and <span class="mark">icheck.js</span> file to your site.
              </li>
              <li>
                <p>Insert before <span class="mark">&lt;/head></span> in your HTML (replace <span class="mark">your-path</span> and <span class="mark">color-scheme</span>):</p>
<pre class="markup">
&lt;link href="your-path/line/color-scheme.css" rel="stylesheet">
&lt;script src="your-path/icheck.js">&lt;/script>
</pre>
                  <p>Example for a <strong>Red</strong> color scheme:</p>
<pre class="markup">
&lt;link href="your-path/line/red.css" rel="stylesheet">
&lt;script src="your-path/icheck.js">&lt;/script>
</pre>
              </li>
              <li>
                <p>Add some checkboxes, radio buttons and labels to your HTML:</p>
<pre class="markup">
&lt;input type="checkbox">
&lt;label>Checkbox 1&lt;/label>

&lt;input type="checkbox" checked>
&lt;label>Checkbox 2&lt;/label>

&lt;input type="radio" name="iCheck">
&lt;label>Radio button 1&lt;/label>

&lt;input type="radio" name="iCheck" checked>
&lt;label>Radio button 2&lt;/label>
</pre>
              </li>
              <li>
                <p>Add JavaScript to your HTML to launch iCheck plugin:</p>
<pre class="markup">
&lt;script>
$(document).ready(function(){
  $('input').each(function(){
    var self = $(this),
      label = self.next(),
      label_text = label.text();

    label.remove();
    self.iCheck({
      checkboxClass: 'icheckbox_line',
      radioClass: 'iradio_line',
      insert: '&lt;div class="icheck_line-icon">&lt;/div>' + label_text
    });
  });
});
&lt;/script>
</pre>
                <p>For different from black color schemes use this code (example for <strong>Red</strong>):</p>
<pre class="markup">
&lt;script>
$(document).ready(function(){
  $('input').each(function(){
    var self = $(this),
      label = self.next(),
      label_text = label.text();

    label.remove();
    self.iCheck({
      checkboxClass: 'icheckbox_line-red',
      radioClass: 'iradio_line-red',
      insert: '&lt;div class="icheck_line-icon">&lt;/div>' + label_text
    });
  });
});
&lt;/script>
</pre>
              </li>
              <li>Done.</li>
            </ol>
          </dd>
          <dt>使用说明</dt>
        </dl>
      </div>
      <div class="skin skin-polaris">
        <div class="arrows">
          <div class="top" data-to="skin-line"></div>
          <div class="bottom" data-to="skin-futurico"></div>
        </div>
        <h3>Polaris 皮肤</h3>
        <dl class="clear">
          <dd class="selected">
            <div class="skin-section">
              <h4>Live</h4>
              <ul class="list">
                <li>
                  <input tabindex="21" type="checkbox" id="polaris-checkbox-1">
                  <label for="polaris-checkbox-1">Checkbox 1</label>
                </li>
                <li>
                  <input tabindex="22" type="checkbox" id="polaris-checkbox-2" checked>
                  <label for="polaris-checkbox-2">Checkbox 2</label>
                </li>
                <li>
                  <input type="checkbox" id="polaris-checkbox-disabled" disabled>
                  <label for="polaris-checkbox-disabled">Disabled</label>
                </li>
                <li>
                  <input type="checkbox" id="polaris-checkbox-disabled-checked" checked disabled>
                  <label for="polaris-checkbox-disabled-checked">Disabled &amp; checked</label>
                </li>
              </ul>
              <ul class="list">
                <li>
                  <input tabindex="23" type="radio" id="polaris-radio-1" name="polaris-radio">
                  <label for="polaris-radio-1">Radio button 1</label>
                </li>
                <li>
                  <input tabindex="24" type="radio" id="polaris-radio-2" name="polaris-radio" checked>
                  <label for="polaris-radio-2">Radio button 2</label>
                </li>
                <li>
                  <input type="radio" id="polaris-radio-disabled" disabled>
                  <label for="polaris-radio-disabled">Disabled</label>
                </li>
                <li>
                  <input type="radio" id="polaris-radio-disabled-checked" checked disabled>
                  <label for="polaris-radio-disabled-checked">Disabled &amp; checked</label>
                </li>
              </ul>
            </div>
            <div class="skin-section skin-states">
              <h4>States</h4>
              <ul class="list">
                <li>
                  <div class="state icheckbox_polaris"></div>
                  <div class="state iradio_polaris"></div>
                  Normal
                </li>
                <li>
                  <div class="state icheckbox_polaris hover"></div>
                  <div class="state iradio_polaris hover"></div>
                  Hover
                </li>
                <li>
                  <div class="state icheckbox_polaris checked"></div>
                  <div class="state iradio_polaris checked"></div>
                  Checked
                </li>
                <li>
                  <div class="state icheckbox_polaris disabled"></div>
                  <div class="state iradio_polaris disabled"></div>
                  Disabled
                </li>
                <li>
                  <div class="state icheckbox_polaris checked disabled"></div>
                  <div class="state iradio_polaris checked disabled"></div>
                  Disabled &amp; checked
                </li>
              </ul>
            </div>
            <script>
            $(document).ready(function(){
              $('.skin-polaris input').iCheck({
                checkboxClass: 'icheckbox_polaris',
                radioClass: 'iradio_polaris',
                increaseArea: '-10%'
              });
            });
            </script>
          </dd>
          <dt class="selected">Demo</dt>
          <dd>
            <div class="skin-pre">
              <p>
                Make sure <a href="http://jquery.com" target="blank">jQuery v1.7+</a> (or <a href="http://github.com/madrobby/zepto#zepto-modules" target="blank">Zepto</a> [polyfill, event, data]) is loaded before the <span class="mark">icheck.js</span>.
              </p>
            </div>
            <ol class="skin-usage">
              <li>
                Copy <span class="mark">/skins/polaris/</span> folder and <span class="mark">icheck.js</span> file to your site.
              </li>
              <li>
                <p>Insert before <span class="mark">&lt;/head></span> in your HTML (replace <span class="mark">your-path</span> and <span class="mark">color-scheme</span>):</p>
<pre class="markup">
&lt;link href="your-path/polaris/polaris.css" rel="stylesheet">
&lt;script src="your-path/icheck.js">&lt;/script>
</pre>
              </li>
              <li>
                <p>Add some checkboxes and radio buttons to your HTML:</p>
<pre class="markup">
&lt;input type="checkbox">
&lt;input type="checkbox" checked>
&lt;input type="radio" name="iCheck">
&lt;input type="radio" name="iCheck" checked>
</pre>
              </li>
              <li>
                <p>Add JavaScript to your HTML to launch iCheck plugin:</p>
<pre class="markup">
&lt;script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_polaris',
    radioClass: 'iradio_polaris',
    increaseArea: '-10%' <span class="comment">// optional</span>
  });
});
&lt;/script>
</pre>
              </li>
              <li>Done.</li>
            </ol>
          </dd>
          <dt>使用说明</dt>
        </dl>
      </div>
      <div class="skin skin-futurico">
        <div class="arrows">
          <div class="top" data-to="skin-polaris"></div>
          <div class="bottom" data-to="usage"></div>
        </div>
        <h3>Futurico 皮肤</h3>
        <dl class="clear">
          <dd class="selected">
            <div class="skin-section">
              <h4>Live</h4>
              <ul class="list">
                <li>
                  <input tabindex="25" type="checkbox" id="futurico-checkbox-1">
                  <label for="futurico-checkbox-1">Checkbox 1</label>
                </li>
                <li>
                  <input tabindex="26" type="checkbox" id="futurico-checkbox-2" checked>
                  <label for="futurico-checkbox-2">Checkbox 2</label>
                </li>
                <li>
                  <input type="checkbox" id="futurico-checkbox-disabled" disabled>
                  <label for="futurico-checkbox-disabled">Disabled</label>
                </li>
                <li>
                  <input type="checkbox" id="futurico-checkbox-disabled-checked" checked disabled>
                  <label for="futurico-checkbox-disabled-checked">Disabled &amp; checked</label>
                </li>
              </ul>
              <ul class="list">
                <li>
                  <input tabindex="27" type="radio" id="futurico-radio-1" name="futurico-radio">
                  <label for="futurico-radio-1">Radio button 1</label>
                </li>
                <li>
                  <input tabindex="28" type="radio" id="futurico-radio-2" name="futurico-radio" checked>
                  <label for="futurico-radio-2">Radio button 2</label>
                </li>
                <li>
                  <input type="radio" id="futurico-radio-disabled" disabled>
                  <label for="futurico-radio-disabled">Disabled</label>
                </li>
                <li>
                  <input type="radio" id="futurico-radio-disabled-checked" checked disabled>
                  <label for="futurico-radio-disabled-checked">Disabled &amp; checked</label>
                </li>
              </ul>
            </div>
            <div class="skin-section skin-states">
              <h4>States</h4>
              <ul class="list">
                <li>
                  <div class="state icheckbox_futurico"></div>
                  <div class="state iradio_futurico"></div>
                  Normal
                </li>
                <li>
                  <div class="state icheckbox_futurico checked"></div>
                  <div class="state iradio_futurico checked"></div>
                  Checked
                </li>
                <li>
                  <div class="state icheckbox_futurico disabled"></div>
                  <div class="state iradio_futurico disabled"></div>
                  Disabled
                </li>
                <li>
                  <div class="state icheckbox_futurico checked disabled"></div>
                  <div class="state iradio_futurico checked disabled"></div>
                  Disabled &amp; checked
                </li>
              </ul>
            </div>
            <script>
            $(document).ready(function(){
              $('.skin-futurico input').iCheck({
                checkboxClass: 'icheckbox_futurico',
                radioClass: 'iradio_futurico',
                increaseArea: '20%'
              });
            });
            </script>
          </dd>
          <dt class="selected">Demo</dt>
          <dd>
            <div class="skin-pre">
              <p>
                Make sure <a href="http://jquery.com" target="blank">jQuery v1.7+</a> (or <a href="http://github.com/madrobby/zepto#zepto-modules" target="blank">Zepto</a> [polyfill, event, data]) is loaded before the <span class="mark">icheck.js</span>.
              </p>
            </div>
            <ol class="skin-usage">
              <li>
                Copy <span class="mark">/skins/futurico/</span> folder and <span class="mark">icheck.js</span> file to your site.
              </li>
              <li>
                <p>Insert before <span class="mark">&lt;/head></span> in your HTML (replace <span class="mark">your-path</span> and <span class="mark">color-scheme</span>):</p>
<pre class="markup">
&lt;link href="your-path/futurico/futurico.css" rel="stylesheet">
&lt;script src="your-path/icheck.js">&lt;/script>
</pre>
              </li>
              <li>
                <p>Add some checkboxes and radio buttons to your HTML:</p>
<pre class="markup">
&lt;input type="checkbox">
&lt;input type="checkbox" checked>
&lt;input type="radio" name="iCheck">
&lt;input type="radio" name="iCheck" checked>
</pre>
              </li>
              <li>
                <p>Add JavaScript to your HTML to launch iCheck plugin:</p>
<pre class="markup">
&lt;script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_futurico',
    radioClass: 'iradio_futurico',
    increaseArea: '20%' <span class="comment">// optional</span>
  });
});
&lt;/script>
</pre>
              </li>
              <li>Done.</li>
            </ol>
          </dd>
          <dt>使用说明</dt>
        </dl>
      </div>
     <div class="skins-info">
        <p>所有皮肤（除了Line）都是支持透明的，你可以将它们应用在任何背景上。</p>
        <p>Square、Flat、Polaris 和 Futurico 皮肤参考了<a href="http://designmodo.com/freebies/" target="blank">Designmodo's UI packs</a>。</p>
      </div>
    </div>
    <div class="usage">
      <div class="arrows">
        <div class="top" data-to="skin-futurico"></div>
        <div class="bottom" data-to="comparison"></div>
      </div>
      <h2>最简单的使用指南</h2>
      <div class="usage-inner">
        <p>
          iCheck插件就像是复选框和单选按钮的构造器。
          <br><strong>它将每个输入框都用一个div包裹起来</strong>，这样，你就可以按自己的需要定制样式或者使用<span class="self" data-to="skins">自带的皮肤了</span>。
          <br>你还可以通过<span class="mark">insert</span>参数向这个div中放置HTML代码或文本。
        </p>
        <p class="offset">对于下面这段HTML代码：</p>
<pre class="markup">&lt;label&gt;
  &lt;input type="checkbox" name="quux[1]" disabled&gt;
  Foo
&lt;/label&gt;

&lt;label for="baz[1]"&gt;Bar&lt;/label&gt;
&lt;input type="radio" name="quux[2]" id="baz[1]" checked&gt;

&lt;label for="baz[2]"&gt;Bar&lt;/label&gt;
&lt;input type="radio" name="quux[2]" id="baz[2]"&gt;
</pre>
        <p class="offset">在默认参数下使用iCheck时会得到如下结果：</p>
<pre class="markup">&lt;label&gt;
  &lt;div class="icheckbox disabled"&gt;&lt;input type="checkbox" name="quux[1]" disabled&gt;&lt;/div&gt;
  Foo
&lt;/label&gt;

&lt;label for="baz[1]"&gt;Bar&lt;/label&gt;
&lt;div class="iradio checked"&gt;&lt;input type="radio" name="quux[2]" id="baz[1]" checked&gt;&lt;/div&gt;

&lt;label for="baz[2]"&gt;Bar&lt;/label&gt;
&lt;div class="iradio"&gt;&lt;input type="radio" name="quux[2]" id="baz[2]"&gt;&lt;/div&gt;
</pre>
        <p>默认情况下，iCheck并不会给输入框外面包裹的div设置任何CSS样式（在你不使用皮肤的时）。</p>
        <h4 class="options">参数</h4>
        <p>下面是参数列表及其默认值：</p>
<pre class="markup">{
  <span class="comment">// 'checkbox' or 'radio' to style only checkboxes or radio buttons, both by default</span>
  handle: '',

  <span class="comment">// base class added to customized checkboxes</span>
  checkboxClass: 'icheckbox',

  <span class="comment">// base class added to customized radio buttons</span>
  radioClass: 'iradio',

  <span class="comment">// class added on checked state (input.checked = true)</span>
  checkedClass: 'checked',

    <span class="comment">// if not empty, used instead of 'checkedClass' option (input type specific)</span>
    checkedCheckboxClass: '',
    checkedRadioClass: '',

  <span class="comment">// if not empty, added as class name on unchecked state (input.checked = false)</span>
  uncheckedClass: '',

    <span class="comment">// if not empty, used instead of 'uncheckedClass' option (input type specific)</span>
    uncheckedCheckboxClass: '',
    uncheckedRadioClass: '',

  <span class="comment">// class added on disabled state (input.disabled = true)</span>
  disabledClass: 'disabled',

    <span class="comment">// if not empty, used instead of 'disabledClass' option (input type specific)</span>
    disabledCheckboxClass: '',
    disabledRadioClass: '',

  <span class="comment">// if not empty, added as class name on enabled state (input.disabled = false)</span>
  enabledClass: '',

    <span class="comment">// if not empty, used instead of 'enabledClass' option (input type specific)</span>
    enabledCheckboxClass: '',
    enabledRadioClass: '',

  <span class="comment">// class added on hover state (pointer is moved onto an input)</span>
  hoverClass: 'hover',

  <span class="comment">// class added on focus state (input has gained focus)</span>
  focusClass: 'focus',

  <span class="comment">// class added on active state (mouse button is pressed on an input)</span>
  activeClass: 'active',

  <span class="comment">// adds hoverClass to customized input on label hover and labelHoverClass to label on input hover</span>
  labelHover: true,

    <span class="comment">// class added to label if labelHover set to true</span>
    labelHoverClass: 'hover',

  <span class="comment">// increase clickable area by given % (negative number to decrease)</span>
  increaseArea: '',

  <span class="comment">// true to set 'pointer' CSS cursor over enabled inputs and 'default' over disabled</span>
  cursor: false,

  <span class="comment">// set true to inherit original input's class name</span>
  inheritClass: false,

  <span class="comment">// if set to true, input's id is prefixed with 'iCheck-' and attached</span>
  inheritID: false,

  <span class="comment">// add HTML code or text inside customized input</span>
  insert: ''
}
</pre>
        <p>调用iCheck时，只需要将修改了默认值的参数列出来即可：</p>
<pre class="markup">$('input').iCheck({
  labelHover: false,
  cursor: true
});
</pre>
        <p>你可以对上面列出的任何class重置样式。</p>
        <h4 class="init">初始化</h4>
        <p>首先引入<a href="http://jquery.com" target="blank">jQuery v1.7+</a> (或 <a href="http://zeptojs.com" target="blank">Zepto</a>)，然后引入<span class="mark">jquery.icheck.js</span> (或者<span class="mark">zepto.icheck.js</span>) 。</p>
        <p>iCheck支持所有选择器（selectors），并且只针对复选框和单选按钮起作用：</p>
<pre class="markup"><span class="comment">// customize all inputs (will search for checkboxes and radio buttons)</span>
$('input').iCheck();

<span class="comment">// handle inputs only inside $('.block')</span>
$('.block input').iCheck();

<span class="comment">// handle only checkboxes inside $('.test')</span>
$('.test input').iCheck({
  handle: 'checkbox'
});

<span class="comment">// handle .vote class elements (will search inside the element, if it's not an input)</span>
$('.vote').iCheck();

<span class="comment">// you can also change options after inputs are customized</span>
$('input.some').iCheck({
  <span class="comment">// different options</span>
});
</pre>
        <h4 class="callbacks">回调事件</h4>
        <p class="callbacks-info">iCheck提供了大量回调事件，都可以用来监听change事件。</p>
        <table>
          <thead>
            <tr>
              <th>事件名称</th>
              <td>使用时机</td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th>ifClicked</th>
              <td>用户点击了自定义的输入框或与其相关联的label</td>
            </tr>
            <tr>
              <th>ifChanged</th>
              <td>输入框的 <span class="mark">checked</span> 或 <span class="mark">disabled</span> 状态改变了</td>
            </tr>
            <tr>
              <th>ifChecked</th>
              <td>输入框的状态变为 <span class="mark">checked</span></td>
            </tr>
            <tr>
              <th>ifUnchecked</th>
              <td><span class="mark">checked</span> 状态被移除</td>
            </tr>
            <tr>
              <th>ifDisabled</th>
              <td>输入框状态变为 <span class="mark">disabled</span></td>
            </tr>
            <tr>
              <th>ifEnabled</th>
              <td><span class="mark">disabled</span> 状态被移除</td>
            </tr>
            <tr>
              <th>ifCreated</th>
              <td>输入框被应用了iCheck样式</td>
            </tr>
            <tr>
              <th>ifDestroyed</th>
              <td>iCheck样式被移除</td>
            </tr>
          </tbody>
        </table>
        <p>使用<span class="mark">on()</span>方法绑定事件：</p><p>
</p><pre class="markup">$('input').on('ifChecked', function(event){
  alert(event.type + ' callback');
});
</pre>
        <p><span class="mark">ifCreated</span> 事件应该在插件初始化之前绑定。</p>
        <h4 class="methods">方法</h4>
        <p class="methods-info">下面这些方法可以用来通过编程方式改变输入框状态（可以使用任何选择器）：</p>
        <p><span class="mark">$('input').iCheck('check');</span> — 将输入框的状态设置为<span class="mark">checked</span></p>
        <p><span class="mark">$('input').iCheck('uncheck');</span> — 移除 <span class="mark">checked</span> 状态</p>
        <p><span class="mark">$('input').iCheck('toggle');</span> — toggle <span class="mark">checked</span> state</p>
        <p><span class="mark">$('input').iCheck('disable');</span> — 将输入框的状态设置为 <span class="mark">disabled</span></p>
        <p><span class="mark">$('input').iCheck('enable');</span> — 移除 <span class="mark">disabled</span> 状态</p>
        <p><span class="mark">$('input').iCheck('update');</span> — apply input changes, which were done outside the plugin</p>
        <p><span class="mark">$('input').iCheck('destroy');</span> — 移除iCheck样式</p>
      </div>
    </div>
   
  </div>

  
</body>
</html>