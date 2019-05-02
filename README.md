# box linter

<img src="https://raw.githubusercontent.com/hanasuke/box-test/master/image/screenshot.png" witdth="300">

## How To Use
### Settings on box.com
- put `boxlint.txt` in target folder
  - the file doesn't affect descendant file/folder

### Execution
1. copy `.env` from `.env.sample`
2. put your variables in `.env` from [developer console](https://app.box.com/developers/console)
3. `bundle install`
4. `bundle exec ruby exec.rb`

## Syntax of `boxlint.txt`
### Overview
- write in yaml

### list
|key|value type|default|description|
|:---|:---|:---|:---|
|description|boolean|false|Force the entry of the 'description'|
|name|string(regexp)|nil|Force the name pattern of the file/folder|
|ignore_pattern|array|nil|対象外のファイル名パターン(regexp)|

### sample
```yaml
description: true
name: '^[0-9]{2}\..+$'
ignore_pattern:
  - '^_'
  - 'tmp'
```
