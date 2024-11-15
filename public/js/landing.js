const product = document.querySelectorAll('.product');

product.forEach(product => {
    const productGame = product.querySelector('.hidden');

    console.log(productGame.value);
    switch (productGame.value){
        case '1':
            product.classList.add('MTG');
            break;
        case '2':
            product.classList.add('YGO');
            break;
        case '3':
            product.classList.add('POK');
            break;
        case '4':
            product.classList.add('LOR');
            break;
        case '5':
            product.classList.add('OP');
            break;
        default:
            product.classList.add('other');
            break;
    }
});