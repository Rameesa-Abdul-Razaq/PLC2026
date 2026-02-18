const prompt=require("prompt-sync")({sigint:true}); //read the input from the terminal
//signt:true lets you exit with ctrl + C
//bascially the scanner from java

const Error_enumobj = {
	//creating enum constants objects from strings
	FP_ROUNDING: "FP_ROUNDING",
	FP_OVERFLOW: "FP_OVERFLOW",
	FP_UNDERFLOW: "FP_UNDERFLOW",
	INT_OVERFLOW: "INT_OVERFLOW"
}

const Result_enumobj = {
	//creating enum constants from strings
    A_BIT_DIFFERENT: "A_BIT_DIFFERENT", 
    INFINITY: "INFINITY", 
    ZERO: "ZERO", 
    VERY_DIFFERENT: "VERY_DIFFERENT"
}

//mapping function, the same as the java switch blocks
function error2Result(err){
    switch (err) {
	case Error_enumobj.FP_ROUNDING:
	 return Result_enumobj.A_BIT_DIFFERENT;
	break;
	case Error_enumobj.FP_OVERFLOW:
	    return Result_enumobj.INFINITY;
	break;
	case Error_enumobj.FP_UNDERFLOW:
	    return Result_enumobj.ZERO;
	break;
	case Error_enumobj.INT_OVERFLOW:
	    return Result_enumobj.VERY_DIFFERENT;
	break;
	default:
		return 'Invalid Error value';
}

// below is  reverse function of the above
/*function result2Error(result){
    switch (result) {
	case Result_enumobj.A_BIT_DIFFERENT:
	 return Error_enumobj.FP_ROUNDING;
	break;
	case Result_enumobj.INFINITY:
	    return Error_enumobj.FP_OVERFLOW;
	break;
	case Result_enumobj.ZERO:
	    return Error_enumobj.FP_UNDERFLOW;
	break;
	case Result_enumobj.VERY_DIFFERENT:
	    return Error_enumobj.INT_OVERFLOW;
	break;
	default:
		return 'Invalid Error value';
}

}
 */

}

console.log('Error list: ', Object.values(Error_enumobj));
 // Oject.value returns the error enums defined before
var validArg = false; 
while(!validArg){ //loop continues if a valid input is not inputted
    var input = prompt("Input: ");
    let result = error2Result(input); 
    if (Object.values(Result_enumobj).includes(result)){
        validArg = true;
		console.log(input + " results in " + error2Result(input));
    }
    else{
        console.log(result);
    }
}
