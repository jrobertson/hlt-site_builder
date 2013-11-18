# Introducing the HLT site-builder gem

The HLT site-builder gem helps you build a simple static website in minutes, not days. All of the information required to build the basic layout (and if you wish, some basic styling) of the website is hand-coded from a raw Dynarex file. The 1st record in the document is the template, while the remaining records are the pages to be generated using the template.

    require 'hlt-site_builder'

    hsb = HltSiteBuilder.new('pages.txt', style: false, container_id: 'main')
    hsb.generate

    hsb.write do |filename, buffer| 
      File.write filename, buffer.sub(/Sitemap<\/a>\s+<\/li>/m,'\0|')
    end

pages.txt:

    <?dynarex schema='pages/page(content)'?>
    --+

    content:html
      head {lang: 'en'}
        title Ruby Community Caf&eacute;
        meta {charset: 'utf-8'}
        link {rel: 'stylesheet', type: 'text/css', href: 'css/layout.css'}
        link {rel: 'stylesheet', type: 'text/css', href: 'css/style.css'}
      body {style: 'align: center; margin: 2em; padding: 2em;'}
        #wrap {style: 'margin: auto; width: 810px; color: #fff'}
          header {style:  'overflow: hidden'}
            div
              div
                a {href: 'index.html'}
                  h1 Ruby Community Caf&eacute; Project
              div {style: 'float: right'}
                markdown:
                  * Telephone: 0131 xxx xxxx
                  * email: <info@xxxxxx.org.uk>
              nav
                markdown:
                  * {style: 'display:inline'}[home](index.html)
                  * [training](training.html)
                  * [catering](catering.html)
                  * [other](other.html)
          div 
            #main {style: 'overflow: hidden; margin: 0; min-height: 20em; padding: 1.5em'}
          footer 
            section {style: 'float: left'}
              ul
                li
                  a {href: 'index.html'} home 
                li &nbsp;
                li &nbsp;
                li &nbsp;
              ul
                li
                  a {href: 'training.html'} training 
                li &nbsp;
                li &nbsp;
                li &nbsp;
              ul
                li
                  a {href: 'catering.html'} catering 
                li &nbsp;
                li &nbsp;
                li &nbsp;
              ul
                li
                  a {href: 'other.html'} other 
                li &nbsp;
                li &nbsp;
                li &nbsp;

            div {style: 'text-align: right'}
              markdown:
                * {style: 'display:inline'}[Sitemap](sitemap.html)
                * [Contact us](contact-us.html)

                Ruby Community Caf&eacute; project &copy; 2013

    content:Home
      article
          img {src: 'images/cup_of_coffee.png', alt: 'cup of coffee'}
        markdown:
          # Volutpat porta risus ullamcorper
          Nam porta in nibh et molestie. Proin velit dolor, adipiscing eu mauris vitae, convallis congue turpis. 

    content:Training
      article#other
        h1 Training
        #content1 {style: 'width: 27em;'}
          img {alt: 'hygiene', src: 'images/box1.png'}
        markdown:
          * bullet point 1
          * bullet point 2
          * bullet point 3

          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique tortor non accumsan aliquet. Suspendisse consectetur tempor pulvinar. Quisque rhoncus in tortor quis cursus. Nam velit nisl, sollicitudin et faucibus non, ornare eget elit. Vestibulum laoreet congue nulla, rutrum pretium justo feugiat et. Quisque a tincidunt nisl. Aenean sagittis euismod diam in posuere. Integer molestie sit amet lectus tincidunt accumsan. Donec molestie tortor erat, volutpat porta risus ullamcorper pulvinar. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Lorem ipsum dolor sit amet, consectetur adipiscing elit.

          Suspendisse dolor neque, hendrerit in tortor sed, porta varius lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi sit amet ligula vulputate, posuere odio in, ullamcorper est. Aliquam eget nisi vel enim mattis iaculis et at lorem. Integer vehicula at purus in malesuada. Nulla sit amet sem nisi. Nam porta in nibh et molestie. Proin velit dolor, adipiscing eu mauris vitae, convallis congue turpis. Donec volutpat elementum nisl, sit amet semper quam cursus in. Proin vitae dignissim orci. Duis elementum mi est, ut molestie libero rutrum ac. 

    content:Catering
      article
        h1 Catering
        #content1
          img {alt: 'outside catering', src: 'images/box1.png'}
        markdown:
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ultrices pulvinar justo non mollis. Vestibulum blandit commodo varius. Ut porta nisi sit amet leo egestas luctus. Etiam elementum eleifend tincidunt. Nulla sed lacus ut ipsum euismod fringilla eget eget erat. Duis in metus id elit lobortis dignissim eget at risus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras vestibulum sem id ante sollicitudin, in fringilla leo pulvinar.

          Nunc arcu augue, fermentum nec orci dapibus, pellentesque tempor neque. Suspendisse potenti. Morbi nunc eros, ornare quis semper non, facilisis a risus. Donec aliquet vitae magna non vestibulum. Suspendisse lacinia neque consectetur libero condimentum molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam tempus commodo augue sed rhoncus. Fusce metus erat, ornare eget accumsan at, porttitor at ante. Integer quis tempor tellus, eget tristique nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent vehicula metus a tincidunt ornare. Nunc aliquam gravida malesuada. Maecenas mattis felis sed lorem sagittis condimentum. Phasellus faucibus scelerisque magna, sed aliquet mi rhoncus a. 

    content:Other
      article
        h1 Classes
        #content1
          img {alt: 'classes', src: 'images/box1.png'}
        markdown:
          * bullet point 1
          * bullet point 2
          * bullet point 3

          Etiam dictum euismod quam id rutrum. Nullam aliquet eu dui non blandit. Vivamus in lorem id nunc rhoncus condimentum nec vel libero. Sed eu arcu quis est fermentum aliquam. Curabitur adipiscing orci condimentum consequat rhoncus. Etiam in diam libero. Mauris dignissim tortor fringilla, bibendum odio id, condimentum magna. Ut vitae libero purus. Aliquam interdum fringilla faucibus. Cras id tincidunt nisi. Etiam id rutrum augue. Sed sed ornare mi.

          Suspendisse ac placerat magna. Phasellus pulvinar sodales libero, luctus rutrum dui elementum id. Sed dictum lobortis leo vulputate aliquet. Quisque rhoncus quis tortor quis eleifend. Vestibulum sollicitudin cursus venenatis. Morbi orci massa, euismod sed rhoncus nec, posuere non ante. Curabitur posuere lacinia tincidunt. Mauris congue elit ac eros rhoncus feugiat. Aenean ultrices, mi vitae varius porta, augue felis egestas neque, sed tempus mauris orci quis eros. Morbi libero lorem, malesuada sed libero quis, euismod rhoncus metus. Cras sagittis non lorem accumsan euismod. Ut luctus ligula ut arcu commodo lacinia iaculis eget urna. 

    content:Contact us
      section
        markdown:
          # Contact us

          * Telephone: 0131 xxxx xxxx
          * email: info@xxxxxx.org.uk

    content:Sitemap
      markdown:
        # Sitemap

        * [home](index.html)
        * [Training](training.html)
        * [Catering](catering.html)
        * [Other](other.html)
        * [contact us](contact-us.html)

## Resources

* [jrobertson/hlt-site_builder](https://github.com/jrobertson/hlt-site_builder)

hltsitebuilder generator html site builder
