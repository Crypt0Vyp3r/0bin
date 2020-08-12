<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>0bin - encrypted pastebin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description"
          content="0bin is a client-side-encrypted
                   pastebin featuring burn after reading, history, and
                   a clipboard">

    <link rel="shortcut icon" href="/favicon.ico">

    %if settings.COMPRESSED_STATIC_FILES:
      <link href="/static/css/style.min.css?{{ VERSION }}"
            rel="stylesheet" />
    %else:
      <link href="/static/css/prettify.css" rel="stylesheet" />
      <link href="/static/css/desert.css" rel="stylesheet" />
      <link href="/static/css/bootswatch.4.5.css" rel="stylesheet">
      <link href="/static/css/style.css?{{ VERSION }}" rel="stylesheet">
    %end

  </head>

  <body>
  
    <div class="topnav" >
      <a class="brand" href="/"><span>ø</span>bin<em>.net</em></a>
      <span class="tagline">"A client side encrypted PasteBin"<br><span>All pastes are AES256 encrypted, we cannot know what you paste...</span>
      </span>

      <nav >
        <ul>
          <li class="submenu" ><a href="#" onclick="ToggleMenu()">Previous pastes +</a>
            <ul class="previous-pastes" id="topmenu">
              <li class="item active"><a href="#">No paste yet...</a></li>
            </ul>
          </li>
        </ul>
      </nav>

    </div>

    <noscript class="container noscript">
          <p>This pastebin uses client-side encryption. Therefore, it needs JavaScript enabled.</p>
          <p>It seems like your browser doesn't have JavaScript enable.</p>
          <p>Please enable JavaScript for this website or use a JavaScript-capable web browser.</p>
    </noscript>

    <div class="container-md" id="wrap-content"> 
        <div id='main' >{{!base}}</div> 
    </div>

    <footer class="footer">   
      <a href="https://www.0bin.net/">Create a paste</a> - <a href="/faq/">Faq</a> - <a href="https://github.com/sametmax/0bin">Github</a> 
      <br>
      %if settings.DISPLAY_COUNTER: 
          <strong>{{ pastes_count }}</strong> pastes øbinned
      %end   
    </footer>


  <script src="/static/js/vue.js"></script>
  %if settings.COMPRESSED_STATIC_FILES:
  <script src="/static/js/main.min.js?{{ VERSION }}"></script>
  %else:
  <script src="/static/js/sjcl.js"></script>
  <script src="/static/js/behavior.js?{{ VERSION }}"></script>
  %end

  <script type="text/javascript">
    zerobin.max_size = {{ settings.MAX_SIZE }};

  </script>

    %if settings.COMPRESSED_STATIC_FILES:
      <script src="/static/js/additional.min.js?{{ settings.VERSION }}"></script>
    %else:
      <script src="/static/js/lzw.js"></script>
      <script src="/static/js/prettify.min.js"></script>
      <script src="/static/js/ZeroClipboard.js"></script>
    %end

    <p id="alert-template" class="alert-primary">
      <a class="close" data-dismiss="alert" href="#">×</a>
      <strong class="title"></strong>
      <span class="message"></span>
    </p>
  
    <script>
      function ToggleMenu() {
        var x = document.getElementById("topmenu");
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
        }
      }
    </script>

  </body>

</html>
