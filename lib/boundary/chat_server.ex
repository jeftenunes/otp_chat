defmodule Boundary.ChatServer do
  use GenServer

  @type message :: %{sender: String.t(), receiver: String.t(), message: String.t()}

  def init(%{} = initial_state) do
    {:ok, initial_state}
  end

  def start_link(initial_state) do
    GenServer.start_link(__MODULE__, Enum.into(initial_state, %{}), name: __MODULE__)
  end

  def handle_cast({:direct, message}, state) do
    {:noreply, Map.put(state, UUID.uuid1(), message)}
  end

  def handle_call(:show, _from, state) do
    {:reply, state, state}
  end

  def send_direct(message) do
    GenServer.cast(__MODULE__, {:direct, message})
  end

  def get_messages do
    GenServer.call(__MODULE__, :show)
  end
end
