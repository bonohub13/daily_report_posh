# daily reports posh (日報の新規ファイルを自動生成するコマンド!)<br/>Powershell verion of daily reports

## 使い方
ディレクトリ```daily_reports_posh```の中の```copy_format.ps1```を実行することでその日の日報を書くためのファイルを
生成出来ます。
- format.md
    - この中に好きなフォーマットの日報のテンプレートを作成します。
    - ただし, 一行目のXXXX年YY月ZZ日の箇所を改変すると正常に動作しないため, する際には```copy_format.ps1```の<br/>```sed "s/月日/..."の一行をコメントアウト, または改変する必要があります。
- copy_format.ps1
    - この中の```$SOURCE_PATH```変数の値をこのレポジトリをクローンしたディレクトリのパスに設定する
    - この中の```FILE_PATH```変数を変更することで好きな場所 (パス) に日報を作成することができる
    - 生成される日報のテンプレートのファイルは```XXXXYYZZ.md (XXXが年YYが月ZZが日)```となる
    - ```FILENAME```変数の中の.mdを好みの拡張子 (.txtなどの自分が書くもの (pdfなど機械が生成するものは不可)) に<br/>変更にすることで, 好みの拡張子の日報のテンプレートの生成が可能
1. 日報のテンプレートを生成するには, ```daily_reports_posh```の中の```copy_format.ps1```を実行するだけ
```./copy_format.ps1```
    - おすすめとしてはPowershellにaliasを設定する
    - これによって簡単になる

## aliasの設定方法
1. ```daily_reports_posh```のディレクトリに入る
    - ```cd daily_reports_posh```
2. aliasを登録する
    - ```echo New-Alias copy_format ". $(Get-Location)/copy_format.ps1" | Add-Content $profile```
3. .bashrcを読み込む
    - ```. $profile```
> 上記の方法はpowershellを使っている人向けです

## Bashのバージョン
> [ここ](https://github.com/bonohub13/daily_report)
