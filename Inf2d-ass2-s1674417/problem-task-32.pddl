(define (problem bar-32) ;; Replace XX with task number
    (:domain bartending
    )
    (:objects 
       
        c - customer
       
        g - glass
        
        b - broom
       
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
        
        (At c LB)
        
        (BrokenGlass MF)
        (BrokenGlass MB)
        
        (At b BAR)
        
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
        (IsServed c)
        (not (exists (?loc - location) (BrokenGlass ?loc )))
        (At Agent BAR)
        
    
    ))
)