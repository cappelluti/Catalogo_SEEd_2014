function vai(url){
    var ua = navigator.userAgent.toLowerCase();
    var isAndroid = ua.indexOf("android") > -1;
    if(isAndroid) {
        navigator.app.loadUrl(url, { openExternal:true });
    } else {
        window.open(url);
    }
}

function pulisci_url(img_copertina){
    img_copertina=img_copertina.substring(27);
    while(img_copertina.indexOf("%20") != -1){img_copertina=img_copertina.replace("%20"," ");}
    while(img_copertina.indexOf("%C3%A0") != -1){img_copertina=img_copertina.replace("%C3%A0","à");}
    while(img_copertina.indexOf("'") != -1){img_copertina=img_copertina.replace("'","");}
    return "http://www.edizioniseed.it/app_catalogo/img/"+img_copertina;
}

function elabora_nodo(campo){
//Funzione utile per riconoscere i paragrafi e i punti elenco
    var nodo_1=campo.children();           
    var testo=[];
    for (a=0; a<nodo_1.length; a++){
        if (nodo_1[a].nodeName.toUpperCase()=="P") {            
            testo.push("<p>"+ elabora_para(nodo_1.eq(a))+"</p>");
        }
        else if (nodo_1[a].nodeName.toUpperCase()=="ELENCO") {
            testo.push("<ul>");
            var nodo_2=nodo_1.eq(a).children();
            for (b=0; b<nodo_2.length; b++){
                if (nodo_2[b].nodeName.toUpperCase()=="LI") {
                    testo.push("<li>"+ elabora_para(nodo_2.eq(b))+"</li>");
                } else  if (nodo_2[b].nodeName.toUpperCase()=="ELENCO2") {
                    testo.push("<ul>");
                    var nodo_3=nodo_2.eq(b).children();
                    for (c=0; c<nodo_3.length; c++){
                        if (nodo_3[c].nodeName.toUpperCase()=="LI") {
                            testo.push("<li>"+ elabora_para(nodo_3.eq(c))+"</li>");
                        }
                    }
                    testo.push("</ul>");
                }
            }
            testo.push("</ul>");
        }
    }
    return testo.join("");
}

function elabora_para(campo){
//Funzione utile per trovare il nodo "corsivo" e "grassetto"
    if (campo.text().length==0) {
    } else if (campo.children().length==0){
        return campo.text();
    } else {
        var para="";
        var lista_contenuti=campo.contents();
        for (a=0; a<lista_contenuti.length; a++){
            contenuto = lista_contenuti.eq(a).text();
            if (lista_contenuti[a].nodeName.toUpperCase()=="CORSIVO"){
                contenuto ="<i>" + contenuto + "</i>";
            } else if (lista_contenuti[a].nodeName.toUpperCase()=="GRASSETTO"){
                contenuto ="<b>" + contenuto + "</b>";
            }
            para = para + contenuto;
        }
        return para;
    }
}