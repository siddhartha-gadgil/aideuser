
* **math_document**: A structured math document in a custom JSON format. Give a JSON list, with each element of the list is a JSON object with exactly one *key-value pair*, with the *key* one of `let`, `some`, `assume`, `def`, `assert`, `theorem`, `problem`, `cases`, `induction`, `contradiction`, `calculate`, `conclude`, `remark`. The descriptions for the choices of *key* and corresponding *value* are as follows:
  * **let**: A statement introducing a new variable with given value, type and/or property. For saying that **some** value of the variable is as needed, use a 'some' statement. Give a JSON object. The keys and corresponding values are as follows.
    * **variable**: The variable being defined (use `<anonymous>` if there is no name such as in `We have a group structure on S`) Give a JSON string.
    * **value**: (OPTIONAL) The value of the variable being defined Give a JSON string.
    * **kind**: (OPTIONAL) The type of the variable, such as `real number`, `function from S to T`, `element of G` etc. Give a JSON string.
    * **properties**: (OPTIONAL) Specific properties of the variable beyond the type. Give a JSON string.
  * **some**: A statement introducing a new variable and saying that **some** value of this variable is as required (i.e., an existence statement). This is possibly with given type and/or property. This corresponds to statements like 'for some integer `n` ...' or 'There exists an integer `n` ....'. Give a JSON object. The keys and corresponding values are as follows.
    * **variable**: The variable being defined (use `<anonymous>` if there is no name such as in `We have a group structure on S`) Give a JSON string.
    * **kind**: (OPTIONAL) The type of the variable, such as `real number`, `function from S to T`, `element of G` etc. Give a JSON string.
    * **properties**: (OPTIONAL) Specific properties of the variable beyond the type. Give a JSON string.
  * **assume**: A mathematical assumption being made. In case this is a variable or structure being introduced, use a 'let' statement. Give a JSON string.
  * **def**: A mathematical term being defined. In case a definition is being used, use 'assert' or 'theorem' instead. Give a JSON object. The keys and corresponding values are as follows.
    * **statement**: The mathematical definition. Give a JSON string.
    * **term**: The term being defined. Give a JSON string.
    * **name**: (OPTIONAL) The name of the theorem, lemma or claim. Give a JSON string.
  * **assert**: A mathematical statement whose proof is a straightforward consequence of given and known results following some method. Give a JSON object. The keys and corresponding values are as follows.
    * **claim**: The mathematical claim being asserted, NOT INCLUDING proofs, justifications or results used. The claim should be purely a logical statement which is the *consequence* obtained. Give a JSON string.
    * **proof_method**: (OPTIONAL) The method used to prove the claim. This could be a direct proof, proof by contradiction, proof by induction, etc. this should be a single phrase or a fairly simple sentence; if a longer justification is needed break the step into smaller steps. If the method is deduction from a result, use the 'deduced_using' field Give a JSON string.
    * **deduced_from_results**: (OPTIONAL) A list of elements of type `deduced_from`. Each element of type `deduced_from` is as follows:
      * **deduced_from**: A deduction of a mathematical result from assumptions or previously known results. Give a JSON object. The keys and corresponding values are as follows.
        * **result_used**: An assumption or previously known results from which the deduction is made. If more than one result is used, list them in the 'deductions' field as separate `deduction` objects. If the result used needs justification, have a separate `assert` object earlier. Give a JSON string.
        * **proved_earlier**: Whether the statement from which deduction has been proved earlier IN THIS DOCUMENT. Answer `true` or `false` (answer `false` if a result from the mathematical literature is being invoked). Give a JSON boolean.
    * **calculate**: (OPTIONAL) An equation, inequality, short calculation etc. Give a JSON object with exactly one *key-value pair*, with the *key* one of `inline_calculation`, `calculation_sequence`.
      * **inline_calculation**: A simple calculation or computation written as a single line. Give a JSON string.
      * **calculation_sequence**: A list of elements of type `calculation_step`. Each element of type `calculation_step` is as follows:
        * **calculation_step**: A step, typically an equality or inequality, in a calculation or computation. Give a JSON string.
    * **missing_proofs**: (OPTIONAL) A list of elements of type `missing`. Each element of type `missing` is as follows:
      * **missing**: A  problem that need to be solved or results that need to be proved to complete the proof. Standard results/criteria may be omitted from the proof: include them in the 'deduced_from' field. Give a JSON string.
    * **errors**: (OPTIONAL) A list of elements of type `error`. Each element of type `error` is as follows:
      * **error**: An error in a proof or calculation. Report only actual errors, with missing steps reported in the 'missing' field. Give a JSON string.
  * **theorem**: A mathematical theorem, with a list of hypotheses and a conclusion. Give a JSON object. The keys and corresponding values are as follows.
    * **hypothesis**: a JSON list of data and assumptions, i.e., **let** and **assume** statements Give a JSON list, with each element of the list is a JSON object with exactly one *key-value pair*, with the *key* one of `let`, `some`, `assume`.
    * **conclusion**: The conclusion of the theorem. Give a JSON string.
    * **proved**: Whether the theorem has been proved, either here or earlier or by citing the literature. Give a JSON boolean.
    * **name**: (OPTIONAL) The name of the theorem, lemma or claim. Give a JSON string.
    * **proof**: (OPTIONAL) A proof of a lemma, theorem or claim, having the same structure as (the value for) a `math_document`. Give a JSON list, with each element of the list is a JSON object with exactly one *key-value pair*, with the *key* one of `let`, `some`, `assume`, `def`, `assert`, `theorem`, `problem`, `cases`, `induction`, `contradiction`, `calculate`, `conclude`, `remark`.
    * **ref**: (OPTIONAL) A reference where the result has been previously proved. Give a JSON string.
    * **cite**: (OPTIONAL) A citation of a result from the mathematical literature which gives the proof. Give a JSON string.
    * **missing_proofs**: (OPTIONAL) A list of elements of type `missing`. Each element of type `missing` is as follows:
      * **missing**: A  problem that need to be solved or results that need to be proved to complete the proof. Standard results/criteria may be omitted from the proof: include them in the 'deduced_from' field. Give a JSON string.
    * **errors**: (OPTIONAL) A list of elements of type `error`. Each element of type `error` is as follows:
      * **error**: An error in a proof or calculation. Report only actual errors, with missing steps reported in the 'missing' field. Give a JSON string.
  * **problem**: A mathematical problem, with a statement and an answer. Give a JSON object. The keys and corresponding values are as follows.
    * **statement**: The statement of the problem. Give a JSON string.
    * **solved**: Whether the problem has been solved. Give a JSON boolean.
    * **answer**: (OPTIONAL) The answer to the problem. Give a JSON string.
    * **proof**: (OPTIONAL) A proof of a lemma, theorem or claim, having the same structure as (the value for) a `math_document`. Give a JSON list, with each element of the list is a JSON object with exactly one *key-value pair*, with the *key* one of `let`, `some`, `assume`, `def`, `assert`, `theorem`, `problem`, `cases`, `induction`, `contradiction`, `calculate`, `conclude`, `remark`.
    * **missing_proofs**: (OPTIONAL) A list of elements of type `missing`. Each element of type `missing` is as follows:
      * **missing**: A  problem that need to be solved or results that need to be proved to complete the proof. Standard results/criteria may be omitted from the proof: include them in the 'deduced_from' field. Give a JSON string.
    * **errors**: (OPTIONAL) A list of elements of type `error`. Each element of type `error` is as follows:
      * **error**: An error in a proof or calculation. Report only actual errors, with missing steps reported in the 'missing' field. Give a JSON string.
  * **cases**: A proof by cases or proof by induction, with a list of cases. Give a JSON object. The keys and corresponding values are as follows.
    * **split_kind**: one of 'implication_direction' (for two sides of an 'iff' implication), 'match' (for pattern matching), 'condition' (if based on a condition being true or false) and 'groups' (for more complex cases).
    * **on**: The variable or expression on which the cases are being done. Write 'implication direction' for an 'iff' statement. Give a JSON string.
    * **proof_cases**: A list of elements of type `case`. Each element of type `case` is as follows:
      * **case**: A case in a proof by cases or proof by induction. Give a JSON object. The keys and corresponding values are as follows.
        * **condition**: The case condition or pattern; for induction one of 'base' or 'induction-step'; for a side of an 'iff' statement write the claim being proved (i.e., the statement `P => Q` or `Q => P`). Give a JSON string.
        * **proof**: A proof of a lemma, theorem or claim, having the same structure as (the value for) a `math_document`. Give a JSON list, with each element of the list is a JSON object with exactly one *key-value pair*, with the *key* one of `let`, `some`, `assume`, `def`, `assert`, `theorem`, `problem`, `cases`, `induction`, `contradiction`, `calculate`, `conclude`, `remark`.
        * **missing_proofs**: (OPTIONAL) A list of elements of type `missing`. Each element of type `missing` is as follows:
          * **missing**: A  problem that need to be solved or results that need to be proved to complete the proof. Standard results/criteria may be omitted from the proof: include them in the 'deduced_from' field. Give a JSON string.
        * **errors**: (OPTIONAL) A list of elements of type `error`. Each element of type `error` is as follows:
          * **error**: An error in a proof or calculation. Report only actual errors, with missing steps reported in the 'missing' field. Give a JSON string.
    * **exhaustiveness**: (OPTIONAL) Proof that the cases are exhaustive, similar to (the value for) 'math_document'. Give a JSON list, with each element of the list is a JSON object with exactly one *key-value pair*, with the *key* one of `let`, `some`, `assume`, `def`, `assert`, `theorem`, `problem`, `cases`, `induction`, `contradiction`, `calculate`, `conclude`, `remark`.
    * **missing_proofs**: (OPTIONAL) A list of elements of type `missing`. Each element of type `missing` is as follows:
      * **missing**: A  problem that need to be solved or results that need to be proved to complete the proof. Standard results/criteria may be omitted from the proof: include them in the 'deduced_from' field. Give a JSON string.
    * **errors**: (OPTIONAL) A list of elements of type `error`. Each element of type `error` is as follows:
      * **error**: An error in a proof or calculation. Report only actual errors, with missing steps reported in the 'missing' field. Give a JSON string.
  * **induction**: A proof by induction, with a base case and an induction step. Give a JSON object. The keys and corresponding values are as follows.
    * **on**: The variable or expression on which induction is being done. Give a JSON string.
    * **proof_cases**: A list of elements of type `case`. Each element of type `case` is as follows:
      * **case**: A case in a proof by cases or proof by induction. Give a JSON object. The keys and corresponding values are as follows.
        * **condition**: The case condition or pattern; for induction one of 'base' or 'induction-step'; for a side of an 'iff' statement write the claim being proved (i.e., the statement `P => Q` or `Q => P`). Give a JSON string.
        * **proof**: A proof of a lemma, theorem or claim, having the same structure as (the value for) a `math_document`. Give a JSON list, with each element of the list is a JSON object with exactly one *key-value pair*, with the *key* one of `let`, `some`, `assume`, `def`, `assert`, `theorem`, `problem`, `cases`, `induction`, `contradiction`, `calculate`, `conclude`, `remark`.
        * **missing_proofs**: (OPTIONAL) A list of elements of type `missing`. Each element of type `missing` is as follows:
          * **missing**: A  problem that need to be solved or results that need to be proved to complete the proof. Standard results/criteria may be omitted from the proof: include them in the 'deduced_from' field. Give a JSON string.
        * **errors**: (OPTIONAL) A list of elements of type `error`. Each element of type `error` is as follows:
          * **error**: An error in a proof or calculation. Report only actual errors, with missing steps reported in the 'missing' field. Give a JSON string.
  * **contradiction**: A proof by contradiction, with an assumption and a proof of the contradiction. Give a JSON object. The keys and corresponding values are as follows.
    * **assumption**: The assumption being made to be contradicted. Give a JSON string.
    * **proof**: The proof of the contradiction given the assumption. Give a JSON list, with each element of the list is a JSON object with exactly one *key-value pair*, with the *key* one of `let`, `some`, `assume`, `def`, `assert`, `theorem`, `problem`, `cases`, `induction`, `contradiction`, `calculate`, `conclude`, `remark`.
    * **missing_proofs**: (OPTIONAL) A list of elements of type `missing`. Each element of type `missing` is as follows:
      * **missing**: A  problem that need to be solved or results that need to be proved to complete the proof. Standard results/criteria may be omitted from the proof: include them in the 'deduced_from' field. Give a JSON string.
    * **errors**: (OPTIONAL) A list of elements of type `error`. Each element of type `error` is as follows:
      * **error**: An error in a proof or calculation. Report only actual errors, with missing steps reported in the 'missing' field. Give a JSON string.
  * **calculate**: An equation, inequality, short calculation etc. Give a JSON object with exactly one *key-value pair*, with the *key* one of `inline_calculation`, `calculation_sequence`.
    * **inline_calculation**: A simple calculation or computation written as a single line. Give a JSON string.
    * **calculation_sequence**: A list of elements of type `calculation_step`. Each element of type `calculation_step` is as follows:
      * **calculation_step**: A step, typically an equality or inequality, in a calculation or computation. Give a JSON string.
  * **conclude**: Conclude a claim obtained from the steps so far. This is typically the final statement of a proof giving the conclusion of the theorem. Give a JSON object. The keys and corresponding values are as follows.
    * **claim**: The conclusion of the proof. Give a JSON string.
    * **missing_proofs**: (OPTIONAL) A list of elements of type `missing`. Each element of type `missing` is as follows:
      * **missing**: A  problem that need to be solved or results that need to be proved to complete the proof. Standard results/criteria may be omitted from the proof: include them in the 'deduced_from' field. Give a JSON string.
    * **errors**: (OPTIONAL) A list of elements of type `error`. Each element of type `error` is as follows:
      * **error**: An error in a proof or calculation. Report only actual errors, with missing steps reported in the 'missing' field. Give a JSON string.
  * **remark**: A remark or comment that is NOT MATHEMATICAL, instead being for motivation, attention, sectioning etc. Give a JSON string.