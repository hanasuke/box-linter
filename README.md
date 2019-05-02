# box-test
test app for box.com

## How To Use
TBD
- 検査対象のディレクトリに, `boxlint.txt` を設置
  - 子ディレクトリ, 孫ディレクトリには影響を与えません

## Syntax of `boxlint.txt`
### Overview
- yamlとして記述

### list
|key|value type|default|description|
|:---|:---|:---|:---|
|description|boolean|false|descriptionの入力を必須にする|
|name|string(regexp)|nil|ファイル/フォルダ名のパターンを強制する|
|ignore_pattern|array|nil|対象外のファイル名パターン(regexp)|

### sample
```yaml
description: true
name: '^[0-9]{2}\..+$'
ignore_pattern:
  - '^_'
  - 'tmp'
```
