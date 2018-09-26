(define (domain bartending)
    (:requirements :adl )
    
    (:types
        
        bartender customer glass - item
        location
        
        
        ;; Fill in additional types here
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - bartender
        BAR - location
        
    )
    
    (:predicates
        ;; Example:
        ;; (Contains ?x - object ?c - container)
        (Adjacent ?x - location ?y - location)
        (At ?x - item  ?y - location)
        (FullGlass ?g - glass) 
        (IsServed ?c - customer )
        (Holding ?g - glass)
        (IsHolding ?a - bartender)
    )
    

    
    (:action PickUp
        :parameters (?a - bartender ?g - glass ?loc - location)
        :precondition (and 
            (not (Holding ?g))
            (not (IsHolding ?a ))
            (not (FullGlass ?g))
            (At ?g ?loc)
            (At Agent ?loc)
            
        )
        :effect(and
            (Holding ?g)
            (IsHolding ?a)
           
        )
    )
    
    
    (:action HandOver 
        :parameters (?a - bartender ?c - customer ?loc -location ?g - glass)
        :precondition (and 
            (At Agent ?loc)
            (At ?c ?loc)
            (Holding ?g)
            (IsHolding ?a)
            (FullGlass ?g)
            (not (IsServed ?c))
            ;(not (At Agent BAR))
        )
        :effect( and
            (IsServed ?c)
            (not (Holding ?g))
            (not (IsHolding ?a))
            
        )
    )
    
    (:action Pour
        :parameters (?a - bartender ?g - glass)
        :precondition ( and
            (At Agent BAR)
            (Holding ?g)
            (IsHolding ?a)
            (not (FullGlass ?g))
            ;(At ?g BAR)
        )
        :effect(
            FullGlass ?g
        )
    )
    
    (:action Move
        :parameters (?x -location ?y -location)
        :precondition ( and
            (At Agent ?x)
            (Adjacent ?x ?y)
        )
        :effect ( and 
            (not (At Agent ?x))
            (At Agent ?y)
        )
    )
    
    
)
