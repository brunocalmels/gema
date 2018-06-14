# == Schema Information
#
# Table name: movimientos
#
#  concepto            :string
#  created_at          :datetime         not null
#  cuenta_credito_id   :bigint(8)
#  cuenta_credito_type :string
#  cuenta_debito_id    :bigint(8)
#  cuenta_debito_type  :string
#  fecha_efectiva      :date
#  fecha_supuesta      :date
#  hecha               :boolean
#  id                  :bigint(8)        not null, primary key
#  monto               :decimal(, )      default(0.0), not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_movimientos_on_cuenta_credito_type_and_cuenta_credito_id
#    (cuenta_credito_type,cuenta_credito_id)
#  index_movimientos_on_cuenta_debito_type_and_cuenta_debito_id
#    (cuenta_debito_type,cuenta_debito_id)
#

class Movimiento < ApplicationRecord
  belongs_to :cuenta_debito, polymorphic: true
  belongs_to :cuenta_credito, polymorphic: true

  validates :monto, presence: true
end