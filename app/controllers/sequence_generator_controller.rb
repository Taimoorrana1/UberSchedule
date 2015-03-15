class SequenceGeneratorController < ApplicationController
  layout 'general_schedule'
before_action :confirm_logged_in,:generateSequence, only: [:Sequence]
  def Sequence

  end

  private
  def generateSequence
    user_id = session[:user_id]
    authorized_student = Student.where(user_id: user_id ).first
    option = authorized_student.option

    @sequence = []
    @sequenceCourses = []
    if option == 'Web Services and Applications'
      @sequence.append(Sequence.where(sequence_name: 'Web Services and Applications').first)
      @sequence.append(Sequence.where(sequence_name: 'Software Engineering Core').first)
    elsif option == 'Computer Games'
      @sequence.append(Sequence.where(sequence_name: 'Computer Games').first)
      @sequence.append(Sequence.where(sequence_name: 'Software Engineering Core').first)
    elsif option == 'RealTime Embedded and Avionics Software'
      @sequence.append(Sequence.where(sequence_name: 'RealTime Embedded and Avionics Software').first)
      @sequence.append(Sequence.where(sequence_name: 'Software Engineering Core').first)
    else
      @sequence.append(Sequence.where(sequence_name: 'general').first)
      @sequence.append(Sequence.where(sequence_name: 'Software Engineering Core').first)
    end
    @sequence.each do |sequence|
      sequence.courses.each do |course|
        @sequenceCourses.append(course)
      end
    end

  end
end
