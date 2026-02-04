//Create list of ints from 1 to 5, Haskell equivalent [1..5]

/*function arrFunc(){
    let arr = [];
    for (let i = 1; i<=5; i++) {
        arr.push(i);
    }
    return arr;    
}

function applicatorFunc(inpFunc, s){
    if(s=='s'){
        const arr = inpFunc();        
        let sum = arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
        return sum;
    }
    else{        
        const arr = inpFunc();
        let sum = arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
        return sum/5;
    }
}

let x = applicatorFunc(arrFunc, 's');
console.log(x);
*/

//A more general implementation of func_as_arg.js that works for the set of integers [a,b]
//Create list of ints from a to b, Haskell equivalent [a..b]
function arrFunc(a, b){
  let arr = [];
  for (let i = a; i<=b; i++) {
    arr.push(i);
  }
  return arr;  
}
function applicatorFunc(inpFunc, s, a, b){
  if(s=='s'){
    const arr = inpFunc(a, b);    
    let sum = arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
    return sum;
  }
  else{    
    const arr = inpFunc(a, b);
    let sum = arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
    return sum/(b-a+1);
  }
}
let x = applicatorFunc(arrFunc, 'a', 1, 10);
console.log(x);