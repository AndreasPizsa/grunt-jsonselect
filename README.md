# grunt-jsonselect

> Select elements from a JSON file using CSS selectors, write each item to an individual JSON files.

Helpful when you have a handful of records in a JSON file but want those records stored individually. I guess static generators can benefit from it. One input file -> one HTML page.

## Getting Started

```npm install --save-dev grunt-jsonselect```

Use `load-grunt-tasks` to automatically enable `grunt-jsonselect` in your `Gruntfile`.

## Usage

```
# Gruntfile.coffee
    :
    jsonselect:
    tests:
      item:       '.objects > *'    # an individual record
      filename:   '.id'             # the filename within that record

            expand:     true
      flatten:    true
      cwd:      'test'
      src:      'fixtures/*.json'
      dest:     'tmp'
      ext:      '.json'
   :
```

Please see [jsonselect.org](http://www.jsonselect.org) for the select syntax.


## Parameters
### item
A CSS selector that selects the items you want to extract.

### filename
An item selector that defines the filename for an item.

