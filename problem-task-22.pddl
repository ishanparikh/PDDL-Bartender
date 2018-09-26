(define (problem bar-22) ;; Replace XX with task number
    (:domain bartending
    )
    (:objects 
       
        c - customer
        g - glass
        LB - location
        UF - location
        UB - location
        LF - location
        MB - location
        MF - location
        
    )
    
    (:init
        (At Agent BAR)
        (At g BAR)
        
        ;(not(FullGlass g))
        (At c LB)
        ;(not (IsServed c))
        ;(not (Holding g))
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
    
    (:goal (
        IsServed c
        
    
    ))
)