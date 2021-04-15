class Main {
    i : IO <- new IO; //declare i and // create object
    main() : Int { 1 };
    main() : Int { {i.out_string("Hello World!\n"); 1;} };
    main() : IO { i.out_string("Hello World!\n")};
    main() : Object { i.out_string("Hello World!\n")};

    main() : Object { (new IO).out_string("Hello World!\n")};
};


class Main inherits IO {
    main() : Object { self.out_string("Hello World!\n")};
    main() : Object { out_string("Hello World!\n")};
};


class Main inherits A2I{ // ASCII to integer 

    main : Object {
        (new IO).out_string("1\n")
        (new IO).out_string((new IO).in_string().concat("\n"))
        (new IO).out_string(a2i((new IO).in_string()).concat("\n"))
        (new IO).out_string(i2a.(a2i((new IO).in_string())+1).concat("\n"))
        (new IO).out_string(i2a.(fact(a2i((new IO).in_string()))).concat("\n"))
    };

    fact(i:Int) : Int { 
        if (i = 0 ) then 1 else i* fact(i-1) fi
    };


    fact( i: Int) : Int {
        let fact : Int <- 1 in {
            while( not (i = 0)) loop {
                fact <- fact * i; 
                i <- i-1;
            }
            pool;
            fact;
        }



    }
};

class List inherits A2I{
    item : String;
    next : List;
    init(i: String, n: List) : List{
        {
            item <- i;
            next <- n;
            self;
        }
    };

    flatten() : String {
        let string : String <- 
            case item of
                i : Int => i2a(i);
                s : String => s;
                o : Object => { abort(); ""; }; // type checking
            esac //reverse of case
        in
            if(isvoid next) then 
                 string
            else
                string.concat(flatten(next))
            fi
    };
};

class Main inherits IO {
    main : Object{
        let hello : String <- "Hello",
            world : String <- "World",
            newline : String <- "\n",
            nil : List,
            list : List <- (new List).init(hello,
                            (new List).init(world,
                             (new List).init(42,
                              (new List).init(newline, nil)))
        in 
            out_string(hello.concat(world.concat(newline)))
    };
};

cool is an expression language
no explicit return
1-> value of methos
= comparision 
<- assignment
let variables
