module ApplicationHelper
  # 時刻表示をシンプルな日本時間に
  def simple_time(time)
    time.strftime("%Y年%m月%d日 %H:%M")
  end
end
