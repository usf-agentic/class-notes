# Sandboxed Coding Agent Notes

we basically watched him build a sandbox for a coding agent

## structure
- tools → split them into helpers
- keeps each function smaller + easier to reuse and debug

## read file tool
- max lines and max bytes → tells the AI how much to read and do
  - so it doesn't pull a huge file into context
- change `open` to `cat` → prevents malicious intent when opening the files
  - `open` runs on your actual machine
  - `cat` runs inside the sandbox so it can only see what's in there

```python
result = sand.run(["cat", path])
if result.exit_code != 0:
    return f"could not read file: {result.stderr.strip()}"
out = result.stdout
```

- check exit code → making sure you can read it
- if it fails → return the stderr so the agent knows what went wrong
- look at std output → that's the actual file contents
- instead of opening files → cat to read the file

### reading in chunks
- `end = offset + MAX_BYTES` → slice it, lets you go through the file in pieces
- alternative: instead of slicing, use `head` to read the first few bytes
  - downside → can't skip though, only reads from the start

## bash tool
- most coding agents have their own interpreter
- give the agent a bash tool → it can do it themselves (ls, grep, run stuff)
- more power but more risk → that's why the sandbox matters

## edit / patch tool
- go to that file, read it, exactly apply the edits
- patch tool → patch the file instead of rewriting the whole thing, makes it more robust
- `before, after = surroundings` → checking the old text matches before replacing
  - if it doesn't match → fail instead of guessing

## sandbox
- run everything only in the sandbox, even for non bash tools (read, edit, patch)
- if even one tool runs outside it → that's a way out

## context
- keep 2 messages in context
- read path and build messages
- compaction → summarize older messages so context doesn't keep growing
- you can also pretend to be an agent → write the messages yourself to test it

## main takeaways
- safety → sandbox + cat
- efficiency → max lines/bytes + compaction
- robustness → checking exit codes + matching old text before patching
