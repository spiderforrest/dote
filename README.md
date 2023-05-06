# Dote (toDO-noTE)

A to-do and note-taking system centered around dependencies and priorities.
Inspiration taken from [paradigm/chore](https://github.com/paradigm/chore).

Dote is made up of a collection of different programs that are all intended to access the same central data storage scheme/location.

## Functionality

### core v 0.1 functionality

- crud operations to data storage scheme
    - write documentation specifying schema for storage

### Features

There are three different types of basic entities in Dote.

- **Task**: A single thing that needs to get done; a single entry on a todo list.

- **Note**: A note to record information in, in the form of plain text. *Can appear on todo list, but cannot be completed like a task. Exists in the global structure, and can be referenced by tasks.*

- **Tags**: Both tasks and notes can be tagged, to group related tasks/notes. Tagged tasks inherit metadata from the tag's metadata, like due dates or priority.

Tasks (and other entities) can placed in a tree structure. Tasks can also have dependencies on any other task, regardless of position in the tree. (Dependency structure is internally a second tree, orthagonal to the first tree.)

## Example format
Project plan, written in the planned format for the pretty file:

```
#dote $03/03 $mid @portfolio &1 [
    X write this todo &2 >3
    settle on final syntax &3 <2 (
        current syntax plan is:
        @ for tag
        $ for due date and priority
        <> for soft parent/child relationship
        [] for hard parent/child relationship (like my mom)
        & for uuid for linking to
        () for an aside, for writing out note like this
    )
    settle on JSON naming scheme &4 (
        id: int
        type: str (task, note, tag)
        name: str
        body: str (stuff in parenthesis)
        due: date
        tags: int array (id)
        parents: int array (id)
        children: int array (id)
        dependsOn: int array (id)
        dependedBy: int array (id)
        updated: date
        completed: bool
    )

    parse script $low &5
    pretty generate script &6
    graph renderer &7
    cli i/o script &8 $high <
        add
        done
        remove/delete
        modify-possibly pop out into external editors
        undo $low
        list/show
    >
    parse dates and adjust priority &9 $low
]
```

