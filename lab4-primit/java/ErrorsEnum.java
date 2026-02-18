import java.util.Scanner;
import java.util.EnumSet;

public class ErrorsEnum
{
    enum Error { FP_ROUNDING, FP_OVERFLOW, FP_UNDERFLOW, INT_OVERFLOW } //The options of errors to choose from

    enum Result { A_BIT_DIFFERENT, INFINITY, ZERO, VERY_DIFFERENT } // the results of each error
    
    private static <E extends Enum<E>> E getEnumElement(String elementTypeName, Class<E> elementType)
    //this is the getter method to get the type name and element type
    {
        boolean haveResult = false;
        E result = null; 
        Scanner stdin = new Scanner(System.in); //create new scanner for this program
        
        while ( ! haveResult ) // while it is not false, so true them
        {
            System.out.print("Input " + elementTypeName + ": "); //promts the user to input something
            //teminal would show: Input "user answer" :. 
            try
            {
                result = Enum.valueOf(elementType, stdin.next().toUpperCase());
                haveResult = true;
                //Enum.valueOf converts the string into a constant from the enum type
                //stdin.next() reads the next word that the user has input
                //toUpperCae() converts the text into upper case
            }
            catch (IllegalArgumentException e) 
            {
                System.out.println("Not a valid " + elementTypeName + ".");
                stdin.nextLine(); // skip the invalid input
            }
        }
        
        stdin.close();
        return result;
    }
  
    /**private static Result error2Result(Error e)
    {
        Result result = null;
        //looks at the value of e and chooses a case from the results enum that was defined earlier
        switch (e) {
        case FP_ROUNDING:
            result = Result.A_BIT_DIFFERENT;
            break;
        case FP_OVERFLOW:
            result = Result.INFINITY;
            break;
        case FP_UNDERFLOW:
            result = Result.ZERO;
            break;
        case INT_OVERFLOW:
            result = Result.VERY_DIFFERENT;
            break;
        }
        
        return result;
    }
 **/

   private static Error result2Error(Result r)
    {
        Error error = null;
        //the above method, but switched around so, result first, and the error shown
        
        switch (r) {
        case A_BIT_DIFFERENT:
            error = Error.FP_ROUNDING;
            break;
        case INFINITY:
            error = Error.FP_OVERFLOW;
            break;
        case ZERO:
            error = Error.FP_UNDERFLOW;
            break;
        case VERY_DIFFERENT:
            error = Error.INT_OVERFLOW;
            break;
        }
        
        return error;
    }

    public static void main(String[] args)
    {
        System.out.print("Known errors = ");
        //the loop goes through the set and compares it with the user input and then returns it if it is correct
        for (Result r : EnumSet.allOf(Error.class)) //creates a set of all errors defined above
        {
            System.out.print(r + " ");
        }
        System.out.println();
        
        //calls the getter method, allowing for the user to input
        Result r = getEnumElement("error", Error.class);
        System.out.println(r + " results in: " + result2Error(r));
    }
}
