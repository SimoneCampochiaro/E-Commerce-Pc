window.addEventListener("load", function (Event) {
    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    var mostra = urlParams.get('id')
    console.log(mostra);
    carica(mostra);
  /*  link.addEventListener("click", function (e) {
        let urlApi = "http://localhost:63342/E-Commerce-Pc/demo/web/src/product.html";
        close();
        open(urlApi);

    })*/
})

function carica(id) {
    let urlApi = "http://localhost:8080/api/get-prodotti/"

    //console.log(id)
    console.log(urlApi)
    fetch(urlApi,
        {
            method: "GET"
        }).then(function (response) {
        console.log(response)
        return response.json()
    }).then(function (data) {

        console.log(data)
        data.forEach(prodotto=>{
            let productTemplate = document.querySelector('.product').cloneNode(true);
            productTemplate.classList.remove('d-none')
            productTemplate.setAttribute("id", 'product-' + prodotto.idProdotto)
            let div=productTemplate.querySelector(`.product-image`)
            div.innerHTML=`<img src="${prodotto.linkImmagine}" >`
            let div1=productTemplate.querySelector('.product-name')
            div1.innerHTML=`${prodotto.componente}`
            let div2=productTemplate.querySelector('.product-description')
            div2.innerHTML=`${prodotto.descrizione}`
            let div3=productTemplate.querySelector('.product-price')
            div3.innerHTML=`${prodotto.prezzoDiVendita}`
            let div4=productTemplate.querySelector('.product-available')
            div4.innerHTML=`${prodotto.disponibilita}`

            document.querySelector('.products').appendChild(productTemplate)

        })


    })
}
