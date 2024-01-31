
class Agenda
	def initialize
		@contacts = []
	end

	def get_all_contacts
		if @contacts.empty?
			return	puts "Nenhum contato cadastrado ainda."
			end
			@contacts.each do |contato|
						puts "#{contato[:nome]} - #{contato[:telefone]}"
			end
			puts "- - - - - - - - - - - - - - "

	end

	def add_contact
			print "Nome: "
			nome = gets.chomp
			print "Telefone: "
			telefone = gets.chomp

		@contacts << {nome:nome,telefone:telefone}
		puts "Contato cadastrado com sucesso!"
	end

	def get_contact
		print "Digite o nome do contato: "
			nome = gets.chomp
			achar_contato = @contacts.find {|contato|contato[:nome].downcase == nome.downcase }
			if achar_contato.nil?
				puts "Contato não encontrado"
				return false
			end

			 	puts "#{achar_contato[:nome]} - #{achar_contato[:telefone]}"
				puts "- - - - - - - - - - - - - - "
			return achar_contato
	end

	def edit_contact
		contact =	get_contact

		if !contact
			return;
		end

		loop do
			puts "Escolha uma das opções abaixo para editar o contato:"
			puts "1. Editar nome\n2. Editar telefone"
			codigo = gets.chomp.to_i

			case
			when codigo == 1
				print "Digite o novo nome do contato: "
				novo_nome = gets.chomp
				contact[:nome] = novo_nome
				break
			when codigo == 2
				print "Digite o novo telefone do contato: "
				novo_telefone = gets.chomp
				contact[:telefone] = novo_telefone
				break
			end
		end
		puts "Contato editado com sucesso!"
	end


	def remove_contact

		findcontact =	get_contact

		if !findcontact
			return;
		end

		@contacts.delete_if {|contact| contact == findcontact}

		puts "Contato deletado com sucesso!"

	end

	def start
		loop do
			puts "1. Contatos\n2. Adicionar contato\n3. Ver Contato\n4. Editar contato\n5. Remover Contato\n0. Sair"
			codigo = gets.chomp.to_i
			case
			when codigo == 0
			puts "Até mais!"
			break
			when codigo == 1
				get_all_contacts
			when codigo == 2
				add_contact
			when codigo == 3
				get_contact
			when codigo == 4
				edit_contact
			when codigo == 5
				remove_contact
			else
				puts "Comando invalido!"
			end
			end
	end
end

Agenda.new.start
