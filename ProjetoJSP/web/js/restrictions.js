//---------------- VALIDAÇÃO CAMPOS TELEFONE ----------------//
function mascara(o, f) {
    v_obj = o;
    v_fun = f;
    setTimeout("execmascara()", 1);
}
function execmascara() {
    v_obj.value = v_fun(v_obj.value);
}
function mtel(v) {
    v = v.replace(/\D/g, "");                  //Remove tudo o que não é dígito
    v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
    v = v.replace(/(\d)(\d{4})$/, "$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
    return v;
}
function id(el) {
    return document.getElementById(el);
}
window.onload = function () {
    id('inputTelefone').onkeypress = function () {
        mascara(this, mtel);
    };
}; //---------------- FIM VALIDAÇÃO CAMPOS TELEFONE ----------------//


//---------------- FUNÇÃO MÁSCARA CPF ----------------//
function formatar(mascara, documento){
  var i = documento.value.length;
  var saida = mascara.substring(0,1);
  var texto = mascara.substring(i);
  
  if (texto.substring(0,1) !== saida){
            documento.value += texto.substring(0,1);
  }  
}
//---------------- FIM MÁSCARA CPF ----------------//


//---------------- VALIDAÇÃO CAMPOS DE NOME COMPLETO ----------------//
function letras(e){
    var expressao;
    expressao = /[a-zA-Z\u00C0-\u00FF ]+/i;
    if (expressao.test(String.fromCharCode(e.keyCode))) {
        return true;
    } else{
        return false;
    };
};//---------------- FIM VALIDAÇÃO CAMPOS DE NOME COMPLETO ----------------//


//---------------- VALIDAÇÃO CAMPOS DE CPF ----------------//
function numeros(e){
    var expressao;
    expressao = /^[\d-.]+$/;
    if (expressao.test(String.fromCharCode(e.keyCode))) {
        return true;
    } else{
        return false;
    };
};//---------------- FIM VALIDAÇÃO CAMPOS CPF ----------------//