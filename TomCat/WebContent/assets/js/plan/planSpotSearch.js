 var daumSearch = {
        /** 초기화. **/
        init : function(){
            this.apikey = "5aad815bb793e165b8de68b1d3e26d3467e96367";
            this.q = document.getElementById('daumSearch');
            
            //검색 객체들 초기화.
       
            daumBlog.init(5);
            
        },
        /** 검색 **/
        search : function(){
            this.query = '?apikey=' + this.apikey 
                + '&output=json&q=' + encodeURI(this.q.value);
            
            //검색어에 맞게 각각 첫페이지를 띄움.
       
            daumBlog.pingSearch(1);
            
        },
        /** callback 함수 호출. **/
        pingSearch : function(ds, api, pgno, callback, result){
            ds.innerHTML = "";
            
            var s = document.createElement('script');
            s.type = 'text/javascript';
            s.charset = 'utf-8';
            s.src = api + this.query + '&pageno=' + pgno 
                + '&callback=' + callback + '&result='+result ; 
            
            ds.appendChild(s);
        },
        /** 결과를 뿌려줌. **/
        pongSearch : function(search, z){
            var ul = document.createElement('ul');
            
            for(var i=0; i<z.channel.item.length; i++){
                //title 정보를 얻음.
                var title = document.createElement('h4');
                var a = document.createElement('a');
                a.href = z.channel.item[i].link;
                a.target = '_blank';
                a.innerHTML = this.escapeHtml(z.channel.item[i].title) 
                    + '<br'+'>';

                title.appendChild(a);
                
                //세부 내용을 얻음.
                var content = search.getContent(z.channel.item[i]);
                
                //리스트 화.
                ul.appendChild(search.getSearch(title,content));
            }
            return ul;
        },
        /** PageNumber를 그려줌. **/
        pongPgno : function(pgno,max,func){
            var maxpg = (pgno+6<max)?pgno+6:max;
            
            var div = document.createElement('div');
            div.align = 'center';
            div.style.clear = 'left'; 
            
            //좌측 화살표.
            var left = document.createElement('a');
            left.innerHTML = "<< ";
            if(pgno-5>1)
                this.onMouseDown(left,pgno-6,func);
            else{
                left.style.color = "gray";
                left.style.cursor = "default";
            }
            div.appendChild(left);
            
            //페이지 번호.
            for(var i=(pgno-5>1)?pgno-5:1; i<maxpg; i++){
                var a = document.createElement('a');
                a.innerHTML = " " + i + " ";

                if(i==pgno){
                    a.style.color = 'yellow';
                    a.style.cursor = "default";
                }
                else
                    this.onMouseDown(a,i,func);
                
                div.appendChild(a);
            }
            
            //우측 화살표.
            var right = document.createElement('a');
            right.innerHTML = ">> ";
            if(pgno+6<max)
                this.onMouseDown(right,pgno+7,func);
            else{
                right.style.color = "gray";
                right.style.cursor = "default";
            }
            div.appendChild(right);
            
            return div;
        },
        /** 마우스 이벤트. **/
        onMouseDown: function(a, i, func){
            a.style.cursor = 'pointer';
            a.onmousedown = function(){
                func(i);
            }
        },
        /** HTML태그 안 먹게 하는 함수 **/
        escapeHtml: function (str) {
            str = str.replace(/&amp;/g, "&");
            str = str.replace(/&lt;/g, "<");
            str = str.replace(/&gt;/g, ">");
            return str;
        }
    };

    window.onload = function () {
        daumSearch.init();
        daumSearch.search();
    };


    
/*
    *//** 이미지 검색. **//*
    var daumImage = {
        *//** 초기화. **//*
        init : function(r){
            daumImage.api = 'http://apis.daum.net/search/image';
            daumImage.pgno = 1;
            daumImage.result = r;
        },
        *//** callback 함수 호출. **//*
        pingSearch : function(pgno){
            daumImage.pgno = pgno;
            
            var ds = document.getElementById('daumImageScript');
            var callback = 'daumImage.pongSearch';
            
            daumSearch.pingSearch(ds,daumImage.api, 
                daumImage.pgno, callback, daumImage.result);  
        },
        *//** 결과를 뿌려줌. **//*
        pongSearch : function(z){
            var dv = document.getElementById('daumImage');
            dv.innerHTML ="";
            dv.appendChild(daumSearch.pongSearch(this, z));
            dv.appendChild(daumSearch.pongPgno(daumImage.pgno, 
                z.channel.totalCount/daumImage.result,daumImage.pingSearch));
        },
        *//** li setting **//*
        getSearch : function(title,content){
            var li = document.createElement('div');
            li.style["border"]="5px solid blue";
            li.style.height = '18em';
            li.style.width = '18em';
            
            li.className='planSpot_tb';
  
            content.appendChild(document.createElement('br'));
           li.appendChild(content);
            li.appendChild(title);
            
            return li;
        },
        *//** 설명 return **//*
       getContent : function(z){
           var a = document.createElement('a');
           var img = document.createElement('img');
           
           a.target = '_blank';
           a.href = z.image;
           
           img.style.height = '20em';
           img.style.width = '30em';
           
           img.src = z.thumbnail;
           
           a.appendChild(img);
           
           return a;
       }
    };*/

/** 블로그 검색. **/
var daumBlog = {
    /** 초기화. **/
    init : function(r){
        daumBlog.api = 'http://apis.daum.net/search/blog';
        daumBlog.pgno = 1;
        daumBlog.result = r;
    },
    /** callback 함수 호출. **/
    pingSearch : function(pgno){
        daumBlog.pgno = pgno;
        
        var ds = document.getElementById('daumBlogScript');
        var callback = 'daumBlog.pongSearch';
        
        daumSearch.pingSearch(ds,daumBlog.api, daumBlog.pgno, 
            callback, daumBlog.result);  
    },
    /** 결과를 뿌려줌. **/
    pongSearch : function(z){
        var dv = document.getElementById('daumBlog');
        dv.innerHTML ="";
        dv.appendChild(daumSearch.pongSearch(this, z));
        dv.appendChild(daumSearch.pongPgno(daumBlog.pgno, 
            z.channel.totalCount/daumBlog.result,daumBlog.pingSearch));
    },
    /** li setting **/
    getSearch : function(title,content){
        var li = document.createElement('li');
       
        li.appendChild(title);
        li.appendChild(content);
        
        return li;
    },
    /** 설명 return **/
   getContent : function(z){
       var a = document.createElement('a');
       
       a.style.color='black';
       a.target = '_blank';
       a.href = z.link;
       a.innerHTML = daumSearch.escapeHtml(z.description);
       
       return a;
   }
};
    
    window.onload = function () {
        daumSearch.init();
        daumSearch.search();
    };
