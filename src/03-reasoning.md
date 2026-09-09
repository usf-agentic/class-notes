# Week 2: Test-Time Compute and Reasoning Models

**Note taker: Ravneet Singh Bhatia**

## Lecture 4: Sept 8


### Test-time compute

Compute is the amount of computation resources consumed.

Usually it is time, and memory.
Time -> fixed context window.

I have time and memory, how can we use them?

Training AI -

- n epochs of training (training time compute)

We eventually hit diminishing returns.

#### Chain of Thought prompting 

This technique is now outdated.
Newer models already have enough training to do this.

- Instead of asking for a direct answer, ask the model for intermediate steps.
- Each intermediate output steers the token distribution towards the next step.
  An incorrect intermediate step can steer it towards another error.

**Variations of CoT**

- zero-shot
    - no examples need.
- few-shot 
    - Include worked examples. The model sees the pattern and applies it.
    - Trade-off: longer prompts and effort to write good examples.


**Why would this work?**

1. Decomposition: Dividing the task into chunks the LLM can manage
2. Intermediate outputs condition the next step
3. Written steps expose checkable claims.

**Limitations**

- Prompting does not change the weights.
- It is costlier
- Self consistency issues
    - Any single reasoning path can fail at any step.
    - An early error can propagate to the final answer.

#### Self Consistency

Generate multiple chains, extract the result, and then choose the most frequent response.

- We need to handle ties. Most-frequent ≠ majority.
- Systemic bias


### Reasoning Models

They may produce 2 separate outputs:

1. Reasoning-like output
    - May be raw-looking text
    - Length and format depend on model and provider

2. Final answer: The response actually shown to the user.

These outputs are usually separated by special tokens.

#### High Reasoning and Fast Inference

Let reasoning be defined as: `response / tokens`
Let inference be defined as: `tokens / second`

Where the output is determined by: `response / tokens`

The formula becomes:

`response / seconds = response / tokens * tokens / second`

When we want high reasoning we maximize `response / tokens`
When we want fast inference we maximize `tokens / second`
