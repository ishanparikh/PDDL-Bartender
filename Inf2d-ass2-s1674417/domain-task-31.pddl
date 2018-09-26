(define (domain bartending)
    (:requirements :adl )
    
    (:types
        
        bartender customer glass broom - item
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
        (Holding ?g - item)
        (BrokenGlass ?loc - location)
        (IsHolding ?a - bartender)
    )
    

    (:action PutDown
        :parameters (?a - bartender ?g - item ?loc - location)
        :precondition (and 
            (Holding ?g)
            (IsHolding ?a)
            (At Agent ?loc)
            
        )
        :effect( and
            (At ?g ?loc)
            (not (IsHolding ?a))
            (not (Holding ?g))
        )
            
    )
    
    
     (:action PickUp
        :parameters (?a - bartender ?g - item ?loc - location)
        :precondition (and 
            ;(not (Holding ?g))
            ;(not (FullGlass ?g))
            
            (At ?g ?loc)
            (At Agent ?loc)
            (not (IsHolding ?a ))
            ;(not (exists(?i - item) (Holding ?i)))
            
            
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
            ;(exists(?i - item) (Holding ?i))
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
            
        )
        :effect(
            FullGlass ?g
        )
    )
    
    (:action Move
        :parameters (?from - location ?to - location)
        :precondition ( and
            (At Agent ?from)
            (Adjacent ?from ?to)
            (not(BrokenGlass ?to))
        )
        :effect ( and 
            (not (At Agent ?from))
            (At Agent ?to)
        )
    )
    
    (:action Sweep
        :parameters (?x - location ?y - location ?b - broom )
        :precondition ( and 
                (Holding ?b )
                (At Agent ?x)
                (Adjacent ?x ?y)
                (BrokenGlass ?y)
        )
        :effect( and
                (not(BrokenGlass ?y))
        
        )
    )
    
    
)