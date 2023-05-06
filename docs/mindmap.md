# mindmap

super concise, all-text format for making [mindmaps](https://en.wikipedia.org/wiki/Mind_map). intended to be an easy way to turn easy to write plain text into a visual diagram, namely a mindmap, quickly.

Consists of three parts; the mindmap spec (the plain text file the human writes), the parser (the piece of software that turns that text into a format that can be visually displayed), and the display application (if rendering to html/css, could just be a web browser)

## Syntax



### `



## Unfiltered brainstorm details

- all mindmaps start with a root element, meant to represent the central concept or thing you're explaining the details of, for example "cat anatomy"
  - all further nodes are children of this element
- nodes branch from there in arbitrary directions and represent sub-concepts within the root element, and subconcepts of subconcepts 
  - nodes have: title, body, (index?)
    - the body contains the data part of the node, and can be subdivided into subsections without branching to a new node
      - it's essentially something like a markdown document where you can use a lot of text (and potentially other data) to write notes like I already do in markdown
      - at any point in the body of a node, you can branch to a new node, with the spot in the node's body you branch from acting as a link to the child node
      - thus, the depth of the node in the tree represents its content's specificity, with deeper nodes being more specific
    - titles should summarize what the node is about at a glance, so just looking at a mindmap's node titles should summarize the components of the central concept
  - nodes can be tagged, which functions as a way to put multiple nodes in the same group
    - no limit on amount of tags on a node
    - visually, nodes with the same tag can be rendered with the same colors or styles to show that they're in a group
  - nodes can also have `asides`, which is secondary information that provides context or depth to the primary info, and is the same text format, but cannot be branched from
    - asides are intended to not be displayed by default
- potentially allow connections between arbitrary nodes regardless of depth, that get rendered as "secondary" links with dotted lines or something similar?
  - these represent connections between concepts that otherwise break the tree structure
  
## aesthetics testing

possible symbols for the format in no particular order

### nodes
- `>`, `>>`, `>>>` for nodes branching deeper, like how indentation works for programming blocks like if statements
- alternately `> , =>, ==>, ====>`
  - nah it looks bad
- alternately alternately you can use either multiple arrows or when the number of arrows would get unwieldy, this: `13>`, for the 13th child node, respectively
- node titles follow the arrows, like `>>>> claws` in the case of the cat anatomy thing
- `---` on own line for asides?? potential conflict with markdown syntax for a lot of this
