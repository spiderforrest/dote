## Dote (toDO-noTE)

A to-do and note-taking system centered around dependencies and priorities.
Inspiration taken from [paradigm/chore](https://github.com/paradigm/chore).


Project plan, written in the planned format for the pretty file:

```
#tono $03/03 $mid @portfolio &1 [
    X write this todo &2 >3
    settle on final syntax &3 <2 (
        current syntax plan is:
        @ for tag
        $ for due date and priority
        # for project
        <>  for soft dependency
        [] for hard dependency
        & for uuid for linking to
        () for an aside, for writing out note like this
    )
    settle on JSON naming scheme &4 (
        id: int
        type: str (item, project, tag)
        name: str
        body: str (stuff in parenthesis)
        due: date
        tags: int array (id)
        projects: int array (id)
        hardSupers: int array (id)
        hardSubs: int array (id)
        softSupers: int array (id)
        softSubs: int array (id)
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
```

