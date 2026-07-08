""" 
AI Generation Verification

PromptValid -> CanGenerate
CanGenerate -> SafeOutput 

Goal:
A valid prompt guarentees that generation occurs and generated output is safe.
 """

""" In Python we do not have an implication operator, so we use its equivalent 
A → B
≡
(not A) or B
"""

def implication(a: bool, b:bool) -> bool:
    return (not a) or b 

""" Now lets define the verification function, which checks whether the AI pipeline satisfies the logical rules. the inputs are simply boolean values representing whether each stage of the pipeline is true or false. """
def verify_ai_pipeline (prompt_valid:bool,
                        can_generate:bool,
                        safe_output:bool) -> bool:
    #let us write our first assumption validity implies generation
    valid_implies_generation = implication(prompt_valid,can_generate)
    # If this retuns a false value, this means our rule has been violated.
    #lets write our second assumption
    generation_implies_safe = implication(can_generate,safe_output)
    # this means if AI generates a response, then the response must be safe.
    
    # only if both assumptions are satisfied do we proceed to verify the theorem.
    if valid_implies_generation and generation_implies_safe:
        return implication(prompt_valid, can_generate and safe_output)
    # if the prompt is valid, then the AI should both generate a response and produce a safe output.
    
    #if either of the two implications are not fulfilled, our whole heorem doesn't apply. If the IF part is false the whole statement is considered true in formal logic because the implication isn't being violated
    return True
