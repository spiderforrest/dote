# Dote (toDO-noTE)

A to-do and note-taking system centered around dependencies and priorities.
Inspiration taken from [paradigm/chore](https://github.com/paradigm/chore).

Dote is made up of a collection of different programs that are all intended to access the same central data storage scheme/location.

## Functionality

### core v 0.1 functionality

- crud operations to data storage scheme
    - write documentation specifying schema for storage

### Features

There are three different types of basic entities in Dote, all of which are represented as nodes in a tree.

- **Task**: A single thing that needs to get done; a single entry on a todo list.

- **Note**: A note to record information in, in the form of plain text. *Can appear on todo list, but cannot be completed like a task. Exists in the global structure, and can be referenced by tasks.*

- **Tags**: Both tasks and notes can be tagged, to group related tasks/notes. Tagged tasks inherit metadata from the tag's metadata, like due dates or priority, if they don't already have it explicitly set.

Tasks (and other nodes) can placed in a tree structure. Tasks can also have dependencies on any other task, regardless of position in the tree. (Dependency structure is internally a second tree, orthagonal to the first tree.)

Any three of these nodes can have the following properties set (though some of them only have effects for specific types.)

- **id**: unique ID number to identify entity **non-optional.**

- **type**: type of the entity, either `task`, `note`, or `tag`. **non-optional.**

- **name**: name of the entity. For tasks, their single-sentence description. For notes, their title. For tags, their tag text. **nonoptional.**

- **body**: additional text to be stored with the entity. For tasks, can contain supplemental information. For notes, the primary body of text. For tags, a description of the tags.

- **target**: an estimated date by which you expect a task to be done (or want to have it done by.) 

- **deadline**: when a task absolutely must be done by. ideal for your taxes.

- **tags**: a list of tags applied to the entity (specified by each tag's id.)

- **parents**: a list of nodes that are parents of the node. *Nodes are allowed to have multiple parents.* For tasks, this means the child tasks MUST be completed before the parent task can be; you can think of them as either dependencies or subtasks.

- **children**: a list of nodes that are children of the node.

- **auxParents**: *This behaves exactly like the tree structure created by the `parents` and `children` properties, but is not correlated with it. This allows you to separately keep track of task structure and the order in which to complete them.*

- **auxChildren**: *Same as above, but children instead*

- **updated**: timestamp of when node was last updated (used to resolve sync conflicts)

- **created** timestamp of when node was originally created

- **completed**: marks if something is done. Most useful for tasks, but also allowed on notes and tags (for instance, to mark them as no longer necessary. Why delete anything ever)



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
        target: date
        deadline: date
        tags: int array (id)
        parents: int array (id)
        children: int array (id)
        dependsOn: int array (id)
        dependedBy: int array (id)
        updated: date
        created: date
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

