# Week 13 Lecture 2: Harness and Prompt Optimization

## Lecture: Nov 19

**Note taker: Thomas Yeung**

### Prompt Optimization

- Evolutionary search over text.
- Existing DSPy framework implements prompt optimization
    - Use by describing pipeline, scoring mechanism, etc.
- MIPROv2 is a prompt optimization algorithm in DSPy
    - Runs agents on examples, stores traces, then an LLM generates result summaries and proposes new prompts
    - Matches combinations of prompts using Bayesian search
- GEPA
    - Stores a candidate pool of algorithms
    - Selects a "parent" to test on a minibatch
    - LLM scores run and provides a reflection
    - Then creates and runs a child, keeping it if it performed better than the parent
    - More accurate and takes fewer rollouts than GRPO (however, this was tested on a small model, and with specific tasks)
- Pareto front
    - Keep all candidates that are best on at least some examples, new parents are selected from this pool
    - Increases diversity compared to only storing a single best candidate
    - Children can be generated from merging parents
- optimize_anything
    - API that can optimize agents, prompts, etc.
    - Demonstrated to significantly improve ARC-AGI agent
    - One of its reasons for being so successful is it adds feedback during evaluation

### Harness Optimization

- Besides the model and prompt, many other features of an agent can be optimized: tools, context policy, loop parameters, etc.
- For example, Pi coding agent can create extensions for itself to extend its capabilities
    - This loop can be automated
        - Propose a skill/extension
        - Agent writes skill/extension
        - Skill/extension tested in sandbox
        - Human review
- ADAS - an agent that writes agent
    - A meta agent selects an agent from an agent archive and refines it until novel and error-free
    - Agent archive stores agent "ideas" that are initially just Python forward functions

### What matters
- Search method
- Providing feedback during evolutionary search
- Train-test split