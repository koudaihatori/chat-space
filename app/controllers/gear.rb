class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(arg)#引数の順番が固定されているのがよくない＝＞キーワード引数
    @chainring = arg[:chainging] || 34#<=デフォルトの値
    #@changing = arg.fetch(:changiing, false)
    #nilを入れなたいとき＝＞fetch メソッド
    @cog = arg[:cog]
    @rim = arg[:rim]
    @tire = arg[:tire]
  end
  def ratio
    chainring / cog.to_f
  end
  def gear_inches
    ratio * diameter
    #裸の状態でよくない、そのインスタンスが自分をよんでいるのがよくない
    #=>クラス名が変更される可能性がある。
    #=> Wheelの専用メソッドになっている
  end
#ダッグタイピング
  def wheel
    Wheel.new(rim, tire)
  end

  def diameter
    wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end
  def diameter
    rim + (tire * 2)
  end
  def circumference
    diameter * Math::PI
  end
end
puts Gear.new(chainging: 52, cog: 11, rim: 26, tire: 1.5).gear_inches

