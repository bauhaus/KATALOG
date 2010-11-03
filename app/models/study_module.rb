class StudyModule < ActiveRecord::Base
  belongs_to :department
  has_and_belongs_to_many :things
  has_and_belongs_to_many :teachers, :class_name => 'Person'
  
  KINDS = %w{ Entwurf Fachkurs Fachmodul Kolloquium Kurs Projekt Projektmodul Seminar Tutorium Übung Vorlesung Werkmodul Workshop Sonstige }
  
  scope :asc, order('name')
end