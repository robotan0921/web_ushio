
    潮研究室 
    ホームページ用論文管理プログラム

最終更新：2016/05/12
Author: Takuro Yamamoto

【概要】
    Excelで管理された論文情報をHTMLへ反映させます．
    論文誌 (journal.xlsx)，国際学会 (international.xlsx)，国内会議 (domestic.xlsx) から論文情報を読み込み，
    html/publication/index.html へ出力します．

    論文情報は，Googleフォームで各々入力されたものが，Googleスプレッドシートへ保存されます．

【使用方法】
    １．Googleスプレッドシートをエクセル形式 (xlsx) でダウンロードする (web_ushio/)
    
    ２．実行する
        以下のコマンドでそれぞれ実行される．
        $ make journal
        $ make international
        $ make domestic

        コマンドが実行されると，html/publication/index.html が更新され，
        新たな論文情報が追加される． 

【メモ】
*リストの判別は，id=***2016 によって行われる
*ラベル"<!--label for parse-->"によってリストを入れ替える
ex.
    <h3 id="paper2016">論文誌</h3>
    <ol>
    <!--label for parse-->
    <li>Daiki Ishii and Toshimitsu Ushio, ... DOI:10.1109/THMS.2014.2360892</li>
	</ol>

以上．
