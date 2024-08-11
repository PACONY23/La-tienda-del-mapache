let data = {};

const getProduct = async id => {
    await fetch(`http://localhost:8080/market_war_exploded/GetProductServlet?id=${id}`, {
        method: 'GET',
        headers:{
            "Accept": "application/json",
            "Content-Type": "application/json"
        }
    }).then(response => response.json()).then(response =>{
        data = response
    }).catch(error => {
        console.log(error);
    })
}

const putProductInformation = async id =>{
    await getProduct(id);
    document.getElementById('u_id').value = data.id;
    document.getElementById('u_name').value = data.name;
    document.getElementById('u_description').value = data.description;
    document.getElementById('u_category').value = data.category.id;
    document.getElementById('u_stock').value = data.stock;
}

const putIdOnForm = (id, flag) =>{
    document.getElementById(flag? 'ch_id' : 'd_id').value = id;
}