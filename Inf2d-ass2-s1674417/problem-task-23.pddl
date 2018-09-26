(define (problem bar-23) ;; Replace XX with task number
    (:domain bartending
    )
    (:objects 
       
        c1 - customer
        c2 - customer
        g1 - glass
        g2 - glass
        LB - location
        UF - location
        UB - location
        LF - location
        MB - location
        MF - location
        
    )
    
    (:init
        (At Agent MF)
        
        (At g1 MB)
        (At g2 LB)
        
        (At c1 UB)
        (At c2 LF)
        ;(not (IsServed c))
        ;(not (Holding g))
        ;(not(FullGlass g))
        
        (Adjacent LB MB)
        (Adjacent MB UB)
        (Adjacent UB UF)
        (Adjacent UF MF)
        (Adjacent MF LF)
        (Adjacent LB LF)
        (Adjacent BAR UF)
        
        (Adjacent MB LB)
        (Adjacent UB MB)
        (Adjacent UF UB)
        (Adjacent MF UF)
        (Adjacent LF MF)
        (Adjacent LF LB)
        (Adjacent UF BAR)
        
        

    )
    
    (:goal (and 
        (IsServed c1)
        (IsServed c2)
        (At Agent BAR)
        
    
    ))
)