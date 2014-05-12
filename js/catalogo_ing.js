$(window).load(carica_xml);

function carica_xml() {
    //Mappa iniziale
    $("#mappa").height (screen.height/3);
    var latlng = new google.maps.LatLng (45.066691, 7.688311);
    var map = new google.maps.Map ($("#mappa")[0], {
    zoom : 15,
    center : latlng,
    mapTypeId : google.maps.MapTypeId.ROADMAP });
    new google.maps.Marker ({ 
        map : map, 
        animation : google.maps.Animation.DROP,
        position : latlng  
    })
    
    $.get("xml/lista.xml", {}, function(data) {
        var output = [];
        var num_scheda = -1;
        schede_tot = 0;
        $(data).find("pubblicazione").each(function() {
            schede_tot++
            num_scheda++;
            
            //Estraggo dati utili
            var img_copertina = pulisci_url($(this).children("img_copertina").attr("fileref"))            
            var titolo = $(this).children("titolo_ing").text();
            if (titolo.length<1) {titolo = $(this).children("titolo").text();}
            var sottotitolo = $(this).children("sottotitolo_ing").text();
            var elenco_autori = $(this).children("elenco_autori").text();
            
            //Monto la lista di <li>
            output.push("<li><a href='#scheda?num_scheda="+num_scheda+"' rel='external'>");
            output.push("<img src='"+img_copertina+"'>");
            output.push("<h3>" + titolo);
            if (sottotitolo.length>0) {output.push("<br><span class='sottotitolo'> " + sottotitolo + "</span>");}
            output.push("</h3>");
            output.push("<p>" + elenco_autori + "</p>");                  
            output.push("</a></li>");
        });
        //Associo la lista di <li> montata prima al div #lista
        $("#lista").append(output.join(""));
		//Ordino
		var mylist = $("#lista");
		var listitems = mylist.children('li').get();
		listitems.sort(function(a, b) {
		   var compA = $(a).text().toUpperCase();
		   var compB = $(b).text().toUpperCase();
		   return (compA < compB) ? -1 : (compA > compB) ? 1 : 0;
		})
		$.each(listitems, function(idx, itm) { mylist.append(itm); });
		
		$("#lista").listview("refresh");
    });
    
    //Associo lo swipe dx e sx alla schermata della scheda
    $("#contenuto_scheda").bind("swiperight",function(event) {
        crea_scheda($(".pul_indietro").attr("id"));
    });
    $("#contenuto_scheda").bind("swipeleft",function(event) {
        crea_scheda($(".pul_avanti").attr("id"));
    });
    
    //Leggo l'url e ne estraggo il valore "num_scheda" per la schermata della scheda
    $('#scheda').bind("pageshow", function(event, data) {
        var num_scheda = decodeURI((RegExp("num_scheda" + '=' + '(.+?)(&|$)').exec(window.location.href)||[,null])[1]);
        crea_scheda(num_scheda);
    });
}

function crea_scheda(num_scheda){
    $.get("xml/lista.xml", {}, function(data) {
        var output = [];
        $(data).find("pubblicazione:eq("+num_scheda+")").each(function(){
            
            //Estraggo dati utili
            var img_copertina = pulisci_url($(this).children("img_copertina").attr("fileref"))
            var titolo = $(this).children("titolo_ing").text();
            if (titolo.length<1) {titolo = $(this).children("titolo").text();}
            var sottotitolo = $(this).children("sottotitolo_ing").text();
            var elenco_autori = $(this).children("elenco_autori").text();
            var id_web = $(this).children("id_web").text();
            var formato = $(this).children("formato").text();
            var n_pagine = $(this).children("n_pagine").text();
            var data_pubblicazione = $(this).children("data_pubblicazione_ing").text();
            var ISBN = $(this).children("ISBN").text();
            var ISBN_ebook = $(this).children("ISBN_ebook").text();
            var costo = $(this).children("costo").text();
            var costo_ebook = $(this).children("costo_ebook").text();
            var note = $(this).children("note").text();
            var presentazione = elabora_nodo($(this).children("presentazione_ing"));
            var destinatari  = elabora_nodo($(this).children("destinatari_ing"));
            var indice  = elabora_nodo($(this).children("indice_ing"));
            var autori  = elabora_autori($(this).children("autori"));
            var recensioni  = elabora_nodo($(this).children("recensioni_ing"));
            
            //Monto la scheda
            output.push("<div class='titolo_scheda'>");
            output.push("<img src='"+img_copertina+"' class='cover'>");
                output.push("<h1>" + titolo +"</h1>");
                if (sottotitolo.length>0) {output.push("<h3>" + sottotitolo + "</h3>");}
                output.push("<p class='autori'>"+elenco_autori+"</p>");
            output.push("</div>");
            output.push("<div class='box_dati'>");
                output.push("<div class='icona_lingua'>")                 
                    if (note.indexOf("Disponibile in inglese")>-1){
                        //icona ita + ing
                         output.push("<img src='img/icona_ita.png'>&nbsp;&nbsp;<img src='img/icona_ing.png'>");
                    } else if (note.indexOf("In inglese")>-1){
                        //icona ing
                         output.push("<img src='img/icona_ing.png'>");
                    } else {
                        //icona ita
                         output.push("<img src='img/icona_ita.png'>");                             
                    }
                output.push("</div>");
				if (data_pubblicazione.length>0){
					output.push("<p>Publication's date: <b>"+data_pubblicazione+"</b></p>");
				}
                output.push("<div class='ui-grid-a'>");
                    output.push("<div class='ui-block-a'>");
                        output.push("<h4>Printed</h4>");
                        output.push("<p>ISBN: <b>"+ISBN+"</b></p>");
                        output.push("<p>Cost: <b>"+costo+" €</b></p>");
                        output.push("<p>Paper size: <b>"+formato+" cm</b></p>");
                        output.push("<p><b>"+n_pagine+" pages</b></p>");
                    output.push("</div>");
                    output.push("<div class='ui-block-b'>");
                    if (ISBN_ebook.length>0) {
                        output.push("<h4>E-book</h4>");
                        output.push("<p>ISBN: <b>"+ISBN_ebook+"</b></p>");
                        output.push("<p>Cost: <b>"+costo_ebook+" €</b></p>");
                        output.push("<div class='ui-grid-a' style='font-weight:bold'>");
                        output.push("   <div class='ui-block-a'>");
                        output.push("       <p><img src='img/logo_epub.png'>&nbsp;epub</br>");
                        output.push("       <img src='img/logo_ibooks.png'>&nbsp;ibook</p>");
                        output.push("   </div>");
                        output.push("   <div class='ui-block-b'>")
                        output.push("       <p><img src='img/logo_kindle.png'>&nbsp;kindle</br>");
                        output.push("       <img src='img/logo_pdf.png'>&nbsp;pdf</p>");
                        output.push("   </div>");
                     }
                    output.push("</div>");
                output.push("</div>");
            output.push("</div>");
            output.push("<p>&nbsp;</p>");
            output.push(presentazione);
			if (indice.length>0){
				output.push("<h4>Contents</h4>");
				output.push(indice);
			}
            output.push("<h4>Authors</h4>");
            output.push(autori);			
			if (destinatari.length>0){
				output.push("<h4>Readership</h4>");
				output.push(destinatari);
			}
            if (recensioni.length>16) {
                output.push("<h4>Reviews</h4>");
                output.push(recensioni);
            }
            
            //associo all'id del pulsante il valore dell'id_web, utile per aprire la pagina web
            $(".pul_acquista").attr("id",id_web);
            
            //associo all'id dei pulsanti avanti e dietro la num_scheda impostando i limiti per la prima e l'ultima scheda  
            num_scheda=Number(num_scheda)
            if (num_scheda==0) {
                    $(".pul_indietro").css({"opacity":0.3});
                    $(".pul_indietro").attr("id",num_scheda);
                } else {
                    $(".pul_indietro").css({"opacity":1});
                    $(".pul_indietro").attr("id",num_scheda-1);
                }
            if (num_scheda==schede_tot-1) {
                    $(".pul_avanti").css({"opacity":0.3});
                    $(".pul_avanti").attr("id",num_scheda);
                } else {
                    $(".pul_avanti").css({"opacity":1});
                    $(".pul_avanti").attr("id",num_scheda+1);
                }
            });
        
            //associo al pulsante di traduzione il link alla corrispondente pagina inglese o italiano
            if ($("#scheda").find("#bottone_ing").length) {
                $("#scheda").find("#bottone_ing").attr("href","index_ing.html#scheda?num_scheda="+num_scheda);
            }
            if ($("#scheda").find("#bottone_ita").length) {
                $("#scheda").find("#bottone_ita").attr("href","index.html#scheda?num_scheda="+num_scheda);
            }
        $("#contenuto_scheda").html(output.join(""));
    }); 
}

function elabora_autori(campo_autori){          
    var nodi_autore=campo_autori.children("autore");
    var testo_autori=[];
    for (p=0; p<nodi_autore.length; p++){
        testo_autori.push("<p><b>"+nodi_autore.eq(p).children("autore_nome").text()+"</b>. "+nodi_autore.eq(p).children("autore_affiliazione_ing").text()+"</p>");
    }
    if (campo_autori.children("autori_note").text().length>0) {
         testo_autori.push("<p><i>"+campo_autori.children("autori_note_ing").text()+"</i></p>");
    }
    return testo_autori.join("");
}