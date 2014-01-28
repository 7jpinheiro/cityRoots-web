/**
 * Created by pc on 1/11/14.
 */
$(function(){
    $('select#attraction_attraction_translation_language_id').change( function() {
        attraction_id=document.getElementById("attraction_id").value;
        language_id=$('option:selected', this).val();
        entra=0;
        alert(language_id);
        for(var translation in gon.attractions_translations){
            trans= gon.attractions_translations[translation];
            if(trans.language_id==language_id){
                document.getElementById("name").value=trans.name;
                document.getElementById("description").value=trans.description;
                document.getElementById("schedule").value=trans.shedule;
                document.getElementById("transport").value=trans.transport;
                document.getElementById("price").value=trans.price;
                entra=1;
            }
        }
        if(entra==0){
            document.getElementById("name").value="";
            document.getElementById("description").value="";
            document.getElementById("schedule").value="";
            document.getElementById("transport").value="";
            document.getElementById("price").value="";
        }else{
            entra=0;
        }
    });
});

